# 🗝️ Terraform Treasure Hunt – Answer Key

This document serves as the **answer sheet** for the broken Terraform repository.  
It lists **all issues we expect participants to find** along with **brief fixes** for each.

---

## 📍 Full List of Issues & Fixes

---

### 🐞 First Bug Found  
## 📂 Repo Structure & Conventions

**Identified Issues:**
- Everything is in one flat folder with no environment separation
- No README describing assumptions / AWS accounts / roles

**Proposed Fixes:**
- Modularize the code and use per-environment overlays or Terraform workspaces
- Add a README and runbook with prerequisites, usage, and architecture details

---

### 🐞 Second Bug Found  
## ⚙️ Provider & State Management

**Identified Issues:**
- `backend "local"` is being used for organization-wide infrastructure
- Provider uses hardcoded `access_key` and `secret_key`
- S3 bucket storing state has `acl = "public-read"`

**Proposed Fixes:**
- Use S3 backend with DynamoDB table for state locking
- Use profiles, assume_role, environment variables, or OIDC for authentication
- Use a private and encrypted S3 bucket created outside Terraform with strict permissions

---

### 🐞 Third Bug Found  
## 🔐 IAM & Identity

**Identified Issues:**
- Inline admin policy `"Action":"*"` attached to an IAM user
- Access keys created for IAM users in code
- No naming or tagging standard for IAM resources
- No cross-account IAM role design

**Proposed Fixes:**
- Use IAM roles with least privilege access and group-based policies
- Avoid creating long-lived access keys unless mandatory; rotate and use short-lived credentials
- Enforce consistent naming and tagging for IAM resources
- Add trust policies and design a multi-account IAM role structure

---

### 🐞 Fourth Bug Found  
## 🌐 Networking

**Identified Issues:**
- Hardcoded CIDR blocks and Availability Zones
- Multiple NAT gateways created incorrectly or wastefully
- `0.0.0.0/0` route present in private route tables
- No tags applied on networking resources

**Proposed Fixes:**
- Use variables and data sources to fetch AZs dynamically
- Standardize NAT gateway strategy (e.g., 1 per AZ or 1 shared)
- Correct route table associations and NAT routes
- Apply common tags across all networking resources

---

### 🐞 Fifth Bug Found  
## 💻 Compute & Architecture

**Identified Issues:**
- Database deployed on a single EC2 instance with `associate_public_ip_address = true`
- Root DB password stored in `user_data`
- App deployed as single EC2 instance with no scalability
- Hardcoded AMI IDs

**Proposed Fixes:**
- Use managed services like RDS for databases
- Store secrets in SSM Parameter Store or Secrets Manager
- Use ASG + ALB for application deployment
- Use variables or AMI lookup data sources for AMI IDs

---

### 🐞 Sixth Bug Found  
## 🏷️ Naming & Tagging

**Identified Issues:**
- Inconsistent resource naming (mix of snake_case and kebab-case)
- No enforced tagging for cost center, owner, environment, project

**Proposed Fixes:**
- Adopt a consistent naming convention
- Enforce tagging policy across all resources

---

### 🐞 Seventh Bug Found  
## 🛡️ Security

**Identified Issues:**
- Security groups are too permissive (`0.0.0.0/0`)
- No encryption enabled for RDS, EBS volumes, or S3 buckets

**Proposed Fixes:**
- Restrict security groups to required ports and CIDRs
- Enable encryption at rest for all storage resources

---

### 🐞 Eighth Bug Found  
## 🏛️ Organizational / Multi-Account Structure

**Identified Issues:**
- Code assumes single AWS account despite multi-account requirement

**Proposed Fixes:**
- Design AWS Organizations structure with OUs: shared-services, security, infra, prod, dev, staging
- Add IAM trust policies and a clear account provisioning strategy

---

## 🏁 Scoring Guidelines

- Each bug/issue listed above is an expected **finding**
- Award points per correctly identified issue
- Bonus points for clear and actionable remediation steps
