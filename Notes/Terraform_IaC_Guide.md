# Terraform Infrastructure as Code (IaC) Guide

## 1. Introduction to Infrastructure as Code (IaC)
Infrastructure as Code allows DevOps engineers to define, provision, and manage cloud infrastructure using declarative configuration files.

---

## 2. Core Terraform Workflow Commands
```bash
# Initialize working directory containing Terraform configuration
terraform init

# Validate configuration syntax and logical correctness
terraform validate

# Create an execution plan showing proposed changes
terraform plan

# Apply changes to provision target cloud resources
terraform apply -auto-approve

# Inspect current state file
terraform show

# Destroy all managed infrastructure resources
terraform destroy
```

---

## 3. Best Practices
- **Remote State**: Store `.tfstate` in AWS S3 with DynamoDB state locking.
- **Modularization**: Break down resources into reusable modules.
- **Variables**: Never hardcode secrets or AWS region strings.
