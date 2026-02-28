

# Production-Ready Azure Infrastructure using Terraform

## 📖 Overview

This project provisions Azure infrastructure using Terraform following production-ready practices such as:

- Remote backend configuration
- State locking
- Lifecycle protection
- Modular architecture
- Clean folder structure

The goal was to simulate a real-world enterprise Infrastructure as Code (IaC) setup.

---

## 🏗 Architecture

Resources Provisioned:

- Azure Resource Group 
- Virtual Network (via reusable module) 
- Subnet 
- Storage Account 
- Remote Backend (Azure Blob Storage)

### Architecture Flow

Terraform 
↓ 
Azure Resource Manager 
↓ 
Resource Group 
↓ 
VNet → Subnet 
↓ 
Storage Account 

---

## 📂 Project Structure

terraform-azure-production-infra/
│
├── backend.tf
├── main.tf
├── providers.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── README.md
│
└── modules/
└── vnet/
├── main.tf
├── variables.tf
└── outputs.tf


---

## 🔐 Remote Backend

- Azure Storage Account
- Blob container for state
- State locking enabled
- Blob versioning enabled
- Soft delete enabled

This ensures centralized and secure state management.

---

## 🛡 Lifecycle Protection

The network components are implemented inside:

modules/vnet/

This approach:

Improves reusability

Reduces duplication

Encourages clean separation of concerns

Makes scaling easier in enterprise environments

The root module calls the network module and exposes required outputs.

Lifecycle Protection

Critical resources such as the Storage Account include lifecycle rules:

Critical resources use:

lifecycle {
prevent_destroy = true
}


This prevents accidental deletion of important resources.

---

## ⚙️ How to Run

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply

🧠 Concepts Demonstrated

Infrastructure as Code (IaC)

Dependency graph execution

Remote backend configuration

State locking

Drift detection

Modular Terraform design

Lifecycle rules

Clean enterprise structure

💡 Key Learnings

Understood Terraform backend initialization process

Learned how state locking prevents race conditions

Practiced lifecycle rule management

Explored dependency graph execution model

Implemented modular reusable infrastructure

🔄 Future Improvements

CI/CD integration

Multi-environment setup

NSG and VM addition

Multi-environment deployment using workspaces

Adding Network Security Groups and virtual machines

Implementing Policy as Code

Policy as Code integration

