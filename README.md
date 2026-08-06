# Three-Page Setup Behind One ALB (ASG + Target Groups)

A runbook for serving three pages — **home**, **laptop**, **mobile** — behind a single
Application Load Balancer, where each page has its own launch template, target group,
and Auto Scaling Group. Routing is **path-based** (`/home`, `/laptop`, `/mobile`); the
default path `/` lands on the home page.

Covers both the **AWS Console** and the **AWS CLI**, with user-data for **Amazon Linux 2023**
and **Ubuntu 24.04**.

---

## 1. Architecture

```
                         Internet
                            │
                    ┌───────▼────────┐
                    │   ALB :80      │  (1 listener)
                    └───────┬────────┘
        ┌───────────────────┼───────────────────┐
   /home* │            /laptop* │           /mobile* │   (listener rules)
     ┌────▼────┐         ┌──────▼───┐         ┌──────▼───┐
     │ home-tg │         │ laptop-tg│         │ mobile-tg│
     └────┬────┘         └──────┬───┘         └──────┬───┘
     ┌────▼────┐         ┌──────▼───┐         ┌──────▼───┐
     │ home-asg│         │laptop-asg│         │mobile-asg│
     │ home-lt │         │laptop-lt │         │mobile-lt │
     └─────────┘         └──────────┘         └──────────┘
```

Two security groups:

- `alb-sg` — inbound HTTP 80 from the world (`0.0.0.0/0`)
- `web-sg` — inbound HTTP 80 from `alb-sg` only

**Why the pages work behind one ALB:** each instance serves its text on *any* path via
Apache's `FallbackResource`. That way both the health check (`/`) and the routed path
(e.g. `/laptop`) return `200` with the correct content.

---

## 2. Prerequisites

- A VPC with at least **two public subnets in different AZs**.
- AWS CLI v2 configured with credentials that can create EC2, ELBv2, and Auto Scaling resources.
- Note down your region, VPC ID, and subnet IDs before starting.

---

## 3. Part 1 — Console

### 3.1 Security groups
*(EC2 → Security Groups → Create security group)*

- **`alb-sg`**: inbound rule → HTTP, port 80, source `0.0.0.0/0`
- **`web-sg`**: inbound rule → HTTP, port 80, source = `alb-sg`

### 3.2 Launch templates
*(EC2 → Launch Templates → Create launch template — do this 3×)*

- **AMI:** Amazon Linux 2023 (or Ubuntu 24.04 — see §5 for the user-data variant)
- **Instance type:** `t3.micro`
- **Security group:** `web-sg`
- **Advanced details → User data:** paste the script from §5, changing the page label
  (`HOME` / `LAPTOP` / `MOBILE`) per template.
- Name them: `home-lt`, `laptop-lt`, `mobile-lt`.




### 3.3 Target groups
*(EC2 → Target Groups → Create target group — 3×)*

- **Type:** Instance
- **Protocol/Port:** HTTP / 80
- **VPC:** your VPC
- **Health check path:** `/`
- Names: `home-tg`, `laptop-tg`, `mobile-tg`
- Do **not** register targets manually — the ASG does that.

### 3.4 Load balancer
*(EC2 → Load Balancers → Create → Application Load Balancer)*

- **Scheme:** Internet-facing, IPv4
- **Subnets:** 2+ public subnets in different AZs
- **Security group:** `alb-sg`
- **Listener:** HTTP : 80 → default action **Forward to `home-tg` , `laptop-tg` , `mobile-tg` **

### 3.5 Listener rules
*(Select the ALB → Listeners → the :80 listener → Manage rules → Add rules)*

| Priority | Condition (path) | Action (forward) |
|----------|------------------|------------------|
| 10       | `/home*`         | `home-tg`        |
| 20       | `/laptop*`       | `laptop-tg`      |
| 30       | `/mobile*`       | `mobile-tg`      |

The default rule stays pointed at `home-tg`.

### 3.6 Auto Scaling Groups
*(EC2 → Auto Scaling Groups → Create — 3×)*

- **Launch template:** the matching `*-lt`
- **Network:** the same public subnets
- **Load balancing:** Attach to an existing load balancer → choose the matching target group
- **Health check type:** ELB, grace period ~120s
- **Capacity:** Min 1 / Desired 1 / Max 2
- Names: `home-asg`, `laptop-asg`, `mobile-asg`

Then grab the ALB DNS name and test `http://<alb-dns>/home`, `/laptop`, `/mobile`.

---

## 4. Part 2 — CLI

Run top to bottom in one shell so the variables carry through. This block uses the
**Amazon Linux 2023** user-data; for Ubuntu, swap the `AMI` lookup and `make_ud`
function per §5.

```bash
# ---- 0. Inputs ----
REGION=ap-south-1
VPC_ID=vpc-xxxxxxxx
SUBNETS="subnet-aaaa subnet-bbbb"     # space-separated for the ELB
SUBNETS_CSV="subnet-aaaa,subnet-bbbb" # comma-separated for the ASG
AMI=$(aws ssm get-parameter \
  --name /aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64 \
  --query Parameter.Value --output text --region $REGION)

# ---- 1. Security groups ----
ALB_SG=$(aws ec2 create-security-group --group-name alb-sg \
  --description "ALB SG" --vpc-id $VPC_ID \
  --query GroupId --output text --region $REGION)
aws ec2 authorize-security-group-ingress --group-id $ALB_SG \
  --protocol tcp --port 80 --cidr 0.0.0.0/0 --region $REGION

WEB_SG=$(aws ec2 create-security-group --group-name web-sg \
  --description "Web SG" --vpc-id $VPC_ID \
  --query GroupId --output text --region $REGION)
aws ec2 authorize-security-group-ingress --group-id $WEB_SG \
  --protocol tcp --port 80 --source-group $ALB_SG --region $REGION

# ---- 2. Launch templates ----
make_ud() {   # $1 = page label  (Amazon Linux 2023)
cat <<EOF | base64 -w0
#!/bin/bash
dnf install -y httpd
echo '<h1>This is $1</h1>' > /var/www/html/index.html
echo 'FallbackResource /index.html' > /etc/httpd/conf.d/fallback.conf
systemctl enable --now httpd
EOF
}

for p in HOME LAPTOP MOBILE; do
  name=$(echo $p | tr '[:upper:]' '[:lower:]')-lt
  aws ec2 create-launch-template --launch-template-name $name \
    --launch-template-data "{\"ImageId\":\"$AMI\",\"InstanceType\":\"t3.micro\",\"SecurityGroupIds\":[\"$WEB_SG\"],\"UserData\":\"$(make_ud $p)\"}" \
    --region $REGION
done

# ---- 3. Target groups ----
HOME_TG=$(aws elbv2 create-target-group --name home-tg --protocol HTTP --port 80 \
  --vpc-id $VPC_ID --target-type instance --health-check-path / \
  --query 'TargetGroups[0].TargetGroupArn' --output text --region $REGION)
LAPTOP_TG=$(aws elbv2 create-target-group --name laptop-tg --protocol HTTP --port 80 \
  --vpc-id $VPC_ID --target-type instance --health-check-path / \
  --query 'TargetGroups[0].TargetGroupArn' --output text --region $REGION)
MOBILE_TG=$(aws elbv2 create-target-group --name mobile-tg --protocol HTTP --port 80 \
  --vpc-id $VPC_ID --target-type instance --health-check-path / \
  --query 'TargetGroups[0].TargetGroupArn' --output text --region $REGION)

# ---- 4. ALB + default listener ----
ALB_ARN=$(aws elbv2 create-load-balancer --name pages-alb --type application \
  --scheme internet-facing --subnets $SUBNETS --security-groups $ALB_SG \
  --query 'LoadBalancers[0].LoadBalancerArn' --output text --region $REGION)

LISTENER_ARN=$(aws elbv2 create-listener --load-balancer-arn $ALB_ARN \
  --protocol HTTP --port 80 \
  --default-actions Type=forward,TargetGroupArn=$HOME_TG \
  --query 'Listeners[0].ListenerArn' --output text --region $REGION)

# ---- 5. Listener rules ----
aws elbv2 create-rule --listener-arn $LISTENER_ARN --priority 10 \
  --conditions Field=path-pattern,Values='/home*' \
  --actions Type=forward,TargetGroupArn=$HOME_TG --region $REGION
aws elbv2 create-rule --listener-arn $LISTENER_ARN --priority 20 \
  --conditions Field=path-pattern,Values='/laptop*' \
  --actions Type=forward,TargetGroupArn=$LAPTOP_TG --region $REGION
aws elbv2 create-rule --listener-arn $LISTENER_ARN --priority 30 \
  --conditions Field=path-pattern,Values='/mobile*' \
  --actions Type=forward,TargetGroupArn=$MOBILE_TG --region $REGION

# ---- 6. Auto Scaling Groups ----
aws autoscaling create-auto-scaling-group --auto-scaling-group-name home-asg \
  --launch-template LaunchTemplateName=home-lt,Version='$Latest' \
  --min-size 1 --max-size 2 --desired-capacity 1 \
  --vpc-zone-identifier "$SUBNETS_CSV" --target-group-arns $HOME_TG \
  --health-check-type ELB --health-check-grace-period 120 --region $REGION
aws autoscaling create-auto-scaling-group --auto-scaling-group-name laptop-asg \
  --launch-template LaunchTemplateName=laptop-lt,Version='$Latest' \
  --min-size 1 --max-size 2 --desired-capacity 1 \
  --vpc-zone-identifier "$SUBNETS_CSV" --target-group-arns $LAPTOP_TG \
  --health-check-type ELB --health-check-grace-period 120 --region $REGION
aws autoscaling create-auto-scaling-group --auto-scaling-group-name mobile-asg \
  --launch-template LaunchTemplateName=mobile-lt,Version='$Latest' \
  --min-size 1 --max-size 2 --desired-capacity 1 \
  --vpc-zone-identifier "$SUBNETS_CSV" --target-group-arns $MOBILE_TG \
  --health-check-type ELB --health-check-grace-period 120 --region $REGION

# ---- 7. Test ----
DNS=$(aws elbv2 describe-load-balancers --load-balancer-arns $ALB_ARN \
  --query 'LoadBalancers[0].DNSName' --output text --region $REGION)
echo "http://$DNS/home ; http://$DNS/laptop ; http://$DNS/mobile"
sleep 120   # let instances boot + pass health checks
curl http://$DNS/home; curl http://$DNS/laptop; curl http://$DNS/mobile
```

---

## 5. OS variants (AMI + user data)

Everything else in the setup (SGs, TGs, ALB, rules, ASGs) is OS-agnostic — only the
AMI and the user data care which distro you run.

### 5.1 Amazon Linux 2023 (uses `dnf`, package/service `httpd`)

AMI lookup:
```bash
AMI=$(aws ssm get-parameter \
  --name /aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64 \
  --query Parameter.Value --output text --region $REGION)
```

User data if your using amazon linux ami:
```bash
#!/bin/bash
dnf install -y httpd
echo '<h1>This is HOME</h1>' > /var/www/html/index.html
echo 'FallbackResource /index.html' > /etc/httpd/conf.d/fallback.conf
systemctl enable --now httpd
```

### 5.2 Ubuntu 24.04 LTS (uses `apt`, package/service `apache2`)

AMI lookup:
```bash
AMI=$(aws ssm get-parameter \
  --name /aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id \
  --query Parameter.Value --output text --region $REGION)
```

User data:
```
#!/bin/bash
apt-get update -y
apt-get install -y apache2
echo '<h1>This is HOME</h1>' > /var/www/html/index.html
echo "Served by: $(hostname)" >> /var/www/html/index.html
echo 'FallbackResource /index.html' > /etc/apache2/conf-available/fallback.conf
a2enconf fallback
systemctl restart apache2
```
```
#!/bin/bash
apt-get update -y
apt-get install -y apache2
echo '<h1>This is LAPTOP</h1>' > /var/www/html/index.html
echo "Served by: $(hostname)" >> /var/www/html/index.html
echo 'FallbackResource /index.html' > /etc/apache2/conf-available/fallback.conf
a2enconf fallback
systemctl restart apache2
```
```
#!/bin/bash
apt-get update -y
apt-get install -y apache2
echo '<h1>This is MOBILE</h1>' > /var/www/html/index.html
echo "Served by: $(hostname)" >> /var/www/html/index.html
echo 'FallbackResource /index.html' > /etc/apache2/conf-available/fallback.conf
a2enconf fallback
systemctl restart apache2
```
Key differences:

- `apt-get` instead of `dnf`.
- Package **and** service are `apache2`, not `httpd`.
- Extra config goes in `conf-available/` and is enabled with `a2enconf` (which symlinks
  it into `conf-enabled/`). On Amazon Linux you drop the file straight into `/etc/httpd/conf.d/`.
- Web root `/var/www/html` is the same on both.

If you use Ubuntu in the CLI block, replace the `make_ud` function's package/service lines accordingly.

---

## 6. Gotchas

- **Subnet list formats differ:** `vpc-zone-identifier` (ASG) is **comma-separated**, ELB
  `--subnets` is **space-separated**. That's why there are two subnet variables. Mixing
  them up is the most common failure.
- **Give it ~2 minutes before testing.** The ASG launches the instance, user data installs
  the web server, then the target group must pass its health checks before the ALB routes traffic.
- **Unhealthy target?** Almost always either `web-sg` not allowing port 80 from `alb-sg`, or the
  web server didn't start. Check `/var/log/cloud-init-output.log` on the instance.
- **Keep `$Latest` single-quoted** in the launch-template version so the shell doesn't expand it.

---

## 7. Teardown

Delete in dependency order so nothing blocks. Assumes the same variables from §4 are still
in your shell (or re-derive the ARNs with `describe-*`).

```bash
# 1. Delete ASGs (force so instances terminate too)
for asg in home-asg laptop-asg mobile-asg; do
  aws autoscaling delete-auto-scaling-group \
    --auto-scaling-group-name $asg --force-delete --region $REGION
done

# 2. Delete the load balancer (removes listener + rules with it)
aws elbv2 delete-load-balancer --load-balancer-arn $ALB_ARN --region $REGION
sleep 30   # wait for the ALB to fully delete before releasing dependencies

# 3. Delete target groups
for tg in $HOME_TG $LAPTOP_TG $MOBILE_TG; do
  aws elbv2 delete-target-group --target-group-arn $tg --region $REGION
done

# 4. Delete launch templates
for lt in home-lt laptop-lt mobile-lt; do
  aws ec2 delete-launch-template --launch-template-name $lt --region $REGION
done

# 5. Delete security groups (web-sg first — alb-sg is referenced by it)
aws ec2 delete-security-group --group-id $WEB_SG --region $REGION
aws ec2 delete-security-group --group-id $ALB_SG --region $REGION
```

> If a security group refuses to delete, an ENI is still attached — wait for ASG instances
> and the ALB to finish terminating, then retry.


```
# For Amazon Linux 2023 / Amazon Linux 2
sudo dnf install -y stress-ng || sudo amazon-linux-extras install epel -y && sudo yum install -y stress

```

```
stress-ng --cpu 0 --timeout 6000s
```
