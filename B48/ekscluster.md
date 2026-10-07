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

to 0.0.0.0/0 is for a short demo only. It is removed when the cluster is deleted.
