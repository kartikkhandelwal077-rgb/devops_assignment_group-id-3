# DevOps Final Assignment Summary & Architecture Report

**Student Name**: Manish Bhatt (24ESKCS600)  
**Repository**: `devops_assignment_group-id-3`  
**Branch**: `Manish_Bhatt(24ESKCS600)`  

---

## 1. Project Overview & Deliverables
This repository contains the complete implementation for the DevOps Lab Assignment covering containerization, infrastructure automation, continuous integration, monitoring, and automated weekly/monthly reporting.

### Core Modules Implemented:
1. **Containerization (`Assignment/app/`)**: Dockerfile, Flask microservice, and Docker Compose with Redis backend.
2. **Infrastructure as Code (`Assignment/terraform/`)**: Terraform AWS EC2 and security group provisioning specifications.
3. **Container Orchestration (`Assignment/k8s/`)**: Kubernetes Deployment and LoadBalancer Service manifests.
4. **CI/CD Pipelines (`Assignment/ci/`, `.github/workflows/`)**: Automated application build/test pipeline and Form-3 PDF reporting workflow.
5. **System Monitoring (`Assignment/monitoring/`)**: Prometheus metrics scraping configuration.
6. **Testing (`Assignment/tests/`)**: PyTest unit testing suite.
7. **Documentation (`Notes/`, `CheatSheet/`)**: Comprehensive technical notes on Docker, K8s, Terraform, DevSecOps, and Git Workflow.

---

## 2. Verification & Automated Reports
- **Weekly Progress Report (Form-3)**: Automatically generated via Python ReportLab/Matplotlib script.
- **Monthly Progress Report (Form-3)**: Generates complete monthly commit metrics across all group contributors.
- **CI/CD Automation**: GitHub Actions workflow (`auto_weekly_report.yml`) scheduled to archive PDF reports automatically every Saturday at 11:59 PM IST.
