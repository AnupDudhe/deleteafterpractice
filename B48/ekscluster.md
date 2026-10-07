# EKS Demo Cluster: ClusterIP, NodePort and LoadBalancer Services

This guide creates an Amazon EKS cluster with a managed node group from AWS CloudShell and demonstrates the three core Kubernetes service types: ClusterIP, NodePort and LoadBalancer.

## Environment Summary

| Item | Value |
|---|---|
| Tool | AWS CloudShell |
| Region | eu-north-1 (Stockholm) |
| Cluster name | demo-eks |
| Kubernetes version | 1.34 |
| Node group | ng-1 (managed, Amazon Linux 2023) |
| Instance type | m7i-flex.large (2 vCPU, 8 GB RAM, free tier eligible) |
| Node count | 2 (min 1, max 2) |
| NAT gateway | Disabled |
| Auto Mode | Off |

## Prerequisites

- AWS account with permissions for EKS, EC2, VPC, IAM and CloudFormation
- AWS Console access with the region set to Stockholm (eu-north-1)

---

## Step 1: Open CloudShell and confirm identity

Open CloudShell from the AWS Console with the region set to Stockholm.

```bash
aws sts get-caller-identity
```

## Step 2: Install eksctl

```bash
mkdir -p $HOME/bin
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" | tar -xz -C $HOME/bin
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
eksctl version
```

## Step 3: Confirm kubectl is available

```bash
kubectl version --client
```

## Step 4: List free tier eligible instance types in the region

```bash
aws ec2 describe-instance-types \
  --filters Name=free-tier-eligible,Values=true \
  --query "InstanceTypes[*].[InstanceType]" \
  --output text --region eu-north-1 | sort
```

Expected output includes `m7i-flex.large`, which is the type used in this setup.

## Step 5: Create the EKS cluster with a managed node group

Takes about 15 to 20 minutes. Keep the CloudShell tab active.

```bash
eksctl create cluster \
  --name demo-eks \
  --region eu-north-1 \
  --nodegroup-name ng-1 \
  --node-type m7i-flex.large \
  --nodes 2 --nodes-min 1 --nodes-max 2 \
  --managed \
  --vpc-nat-mode Disable
```

If CloudShell disconnects during creation, reconnect and check the node group:

```bash
aws eks update-kubeconfig --name demo-eks --region eu-north-1
eksctl get nodegroup --cluster demo-eks --region eu-north-1
```

If no node group exists, create it separately:

```bash
eksctl create nodegroup \
  --cluster demo-eks \
  --region eu-north-1 \
  --name ng-1 \
  --node-type m7i-flex.large \
  --nodes 2 --nodes-min 1 --nodes-max 2 \
  --managed
```

## Step 6: Verify the cluster and confirm Auto Mode is off

```bash
aws eks update-kubeconfig --name demo-eks --region eu-north-1
eksctl get cluster --region eu-north-1
aws eks describe-cluster --name demo-eks --region eu-north-1 \
  --query "cluster.computeConfig.enabled"
```

`false` or `null` confirms Auto Mode is off.

## Step 7: Verify the nodes and their instance type

```bash
kubectl get nodes -o wide -L node.kubernetes.io/instance-type
eksctl get nodegroup --cluster demo-eks --region eu-north-1
```

The `INSTANCE-TYPE` column should show `m7i-flex.large` for both nodes.

## Step 8: Create the demo app and the three services

```bash
cat <<'EOF' > demo.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
spec:
  replicas: 2
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: nginx
        image: nginx:stable
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: web-clusterip
spec:
  type: ClusterIP
  selector:
    app: web
  ports:
  - port: 80
    targetPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: web-nodeport
spec:
  type: NodePort
  selector:
    app: web
  ports:
  - port: 80
    targetPort: 80
    nodePort: 30080
---
apiVersion: v1
kind: Service
metadata:
  name: web-lb
spec:
  type: LoadBalancer
  selector:
    app: web
  ports:
  - port: 80
    targetPort: 80
EOF

kubectl apply -f demo.yaml
kubectl get pods,svc -o wide
```

## Step 9: Test the ClusterIP service (internal only)

```bash
kubectl run tmp --rm -it --image=curlimages/curl --restart=Never -- curl -s web-clusterip
```

Returns the nginx welcome page from inside the cluster. A ClusterIP service is not reachable from outside the cluster.

## Step 10: Test the NodePort service (node public IP on port 30080)

Open port 30080 on the cluster security group:

```bash
SG=$(aws eks describe-cluster --name demo-eks --region eu-north-1 \
  --query "cluster.resourcesVpcConfig.clusterSecurityGroupId" --output text)

aws ec2 authorize-security-group-ingress --group-id $SG \
  --protocol tcp --port 30080 --cidr 0.0.0.0/0 --region eu-north-1
```

Get a node public IP and test:

```bash
NODE_IP=$(kubectl get nodes -o jsonpath='{.items[0].status.addresses[?(@.type=="ExternalIP")].address}')
curl http://$NODE_IP:30080
echo "Browser URL: http://$NODE_IP:30080"
```

## Step 11: Test the LoadBalancer service (AWS load balancer DNS)

Watch the service until EXTERNAL-IP shows a hostname, then press Ctrl+C:

```bash
kubectl get svc web-lb -w
```

Allow 2 to 3 minutes for DNS to resolve, then test:

```bash
LB=$(kubectl get svc web-lb -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
curl http://$LB
echo "Browser URL: http://$LB"
```

## Step 12: Cleanup

Delete the services first so the load balancer is removed before the cluster.

```bash
kubectl delete -f demo.yaml
eksctl delete cluster --name demo-eks --region eu-north-1
```

---

## Service Types at a Glance

| Service type | Reachable from | How it is accessed in this demo |
|---|---|---|
| ClusterIP | Inside the cluster only | `curl web-clusterip` from a temporary pod |
| NodePort | Node public IP on a fixed port (30000 to 32767) | `http://<node-public-ip>:30080` |
| LoadBalancer | Internet through an AWS load balancer | `http://<load-balancer-dns>` |

## Cost Notes

- The m7i-flex.large nodes are free tier eligible and draw from free tier credits.
- The EKS control plane (about $0.10 per hour) is billed separately and is not covered by the free tier.
- The load balancer created in Step 11 is billed hourly.
- Run Step 12 immediately after the demo to stop all charges.

## Security Notes

- The rule opening port 30080 to 0.0.0.0/0 is for a short demo only. It is removed when the cluster is deleted.
