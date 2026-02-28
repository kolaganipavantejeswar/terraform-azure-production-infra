# Production-Ready Azure Infrastructure using Terraform

## 📖 Overview

This project provisions Azure infrastructure using Terraform following production-ready best practices.

The objective of this project was not only to create resources, but to structure the Terraform configuration in an enterprise-ready way with:

- Remote backend configuration
- State locking
- Lifecycle protection
- Modular architecture
- Clean folder structure

This simulates how infrastructure is managed in real-world DevOps environments.

---

## 🏗 Architecture

### Resources Provisioned

- Azure Resource Group  
- Virtual Network (implemented as a reusable module)  
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
Virtual Network → Subnet  
↓  
Storage Account  

---

## 📂 Project Structure

```text
terraform-azure-production-infra/
│
├── backend.tf
├── providers.tf
├── main.tf
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
```


The network layer is implemented inside a reusable module to promote clean architecture and scalability.

---

## 🔐 Remote Backend Configuration

Terraform state is stored in Azure Blob Storage instead of locally.

Features enabled:

- Centralized state storage  
- State locking  
- Blob versioning  
- Soft delete  

This prevents state corruption and enables safe collaboration across environments.

---

## 🛡 Lifecycle Protection

Critical resources include lifecycle rules such as:


lifecycle {

prevent_destroy = true

}


This prevents accidental deletion of important infrastructure during `terraform destroy` or forced replacement scenarios.

---

## ⚙️ How to Run

Initialize Terraform:


terraform init


Format code:


terraform fmt


Validate configuration:


terraform validate


Review execution plan:


terraform plan


Apply infrastructure:


terraform apply


---

## 🧠 Concepts Demonstrated

- Infrastructure as Code (IaC)  
- Dependency graph-based execution  
- Remote backend setup  
- State locking and versioning  
- Drift detection  
- Lifecycle rule management  
- Modular Terraform architecture  
- Clean enterprise folder structure  

---

## 💡 Key Learnings

- Understood Terraform backend initialization process  
- Explored how state locking prevents race conditions  
- Learned how Terraform builds and executes a dependency graph  
- Practiced lifecycle rule management  
- Implemented modular reusable infrastructure design  

---

## 🔄 Future Enhancements

- CI/CD integration (GitHub Actions / Azure DevOps)  
- Multi-environment support using workspaces  
- Add Network Security Groups and Virtual Machines  
- Implement Policy as Code  



