# Terraform Script for AWS Infra

This is the project root for AWS infra setup using Terraform. It automates the provisioning of core AWS resources to ensure a consistent, repeatable, and scalable environment.

## 🏗️ Architecture Overview

This script provisions the following components:

* **VPC**: Custom Virtual Private Cloud with public and private subnets.

---

## 🛠️ Prerequisites

Before you begin, ensure you have the following installed and configured:
Terraform (v1.0.0+)
* AWS CLI configured with appropriate permissions.

---

## 📁 Project Structure

```md
├── modules/           # Reusable, encapsulated infra components
├── .gitignore         # Prevents sensitive files from being tracked
├── develop.tfvars     # Environment-specific input values for the development tier
├── locals.tf          # AWS local constraints
├── main.tf            # Core logic and resource orchestration
├── outputs.tf         # Key resource attributes exposed after apply
├── providers.tf       # AWS provider constraints
├── variables.tf       # Input definitions with descriptions
├── versions.tf        # AWS version constraints
└── README.md          # This file
```
---

## 🚀 Getting Started

**1. Initialization**<br>
Prepare the working directory and download provider plugins.
```bash
terraform init
```

**2. Validation & Planning**<br>
Ensure your syntax is correct and preview the changes before they happen.
```bash
terraform validate
terraform plan -out=tfplan
```

**3. Deployment**<br>
Apply the configuration. Use the plan file for a deterministic deployment.
```bash
terraform apply "tfplan"
```

---

## 📝 Configuration Reference

### Inputs
| Name | Description | Type | Default |
| ---- | ----------- | ---- | ------- |
| region | AWS region to deploy into | string |	us-east-1 |
| project_name | Name tag for all resources | string | dev-infra |

### Outputs
| Name | Description |
| ---- | ----------- |
| vpc_id | The ID of the created VPC |
| public_ip | The public IP of the web server|

---

## 🛡️ Security & State
- **State Locking**: It is highly recommended to use an S3 backend with a DynamoDB table for state locking to prevent concurrent modifications.