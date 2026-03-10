# Terraform AWS Production Infrastructure

This project demonstrates a **production-style AWS infrastructure deployment using Terraform**.  
It provisions a secure and modular AWS environment with reusable modules and multi-environment support.

---

## Architecture Overview

The Terraform configuration creates the following AWS infrastructure:

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- EC2 Instance
- IAM Role and Instance Profile

---
## Infrastructure Components

This project provisions the following AWS resources:

- VPC with public and private subnets
- Internet Gateway for public connectivity
- NAT Gateway for private subnet internet access
- Route tables for traffic routing
- Security groups for instance access control
- EC2 instance deployed inside the VPC
- IAM role and instance profile attached to EC2

  
## Terraform Concepts Used

This project demonstrates several important Terraform concepts:

- Modules
- Variables
- Locals
- Outputs
- Validation
- Sensitive variables
- Data sources
- Backend configuration

---

## Remote Backend Configuration

Terraform remote state is configured using:

- **Amazon S3** for storing the Terraform state
- **DynamoDB** for state locking to prevent concurrent modifications

This setup enables safe team collaboration.

---

## Multi-Environment Support

The project supports multiple environments:

```
environments/
   dev/
      dev.tfvars
   stage/
      stage.tfvars
   prod/
      prod.tfvars
```

Each environment uses its own **tfvars configuration**.

Example:

```
terraform init
terraform plan -var-file=environments/dev/dev.tfvars
terraform apply -var-file=environments/dev/dev.tfvars
```


---

## Project Structure


terraform-aws-production-infrastructure
│
├── modules
│ ├── vpc
│ ├── ec2
│ └── security-group
│
├── environments
│ ├── dev
│ ├── stage
│ └── prod
│
├── backend.tf
├── locals.tf
├── main.tf
├── outputs.tf
├── provider.tf
└── variables.tf


---

## Key Features

- Modular Terraform architecture
- Multi-environment infrastructure deployments
- Remote state management with S3
- State locking with DynamoDB
- Reusable infrastructure modules
- Infrastructure as Code best practices

---
## Tools and Technologies

- Terraform
- AWS (VPC, EC2, IAM, NAT Gateway, Security Groups)
- Amazon S3 (Remote Backend)
- DynamoDB (State Locking)
- Git and GitHub
## Author

**Sai Prasanth Kumar**

DevOps / Cloud Engineer
