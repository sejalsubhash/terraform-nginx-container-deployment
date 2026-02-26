
# 🚀 Terraform Docker NGINX EC2 Deployment

## 📌 Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to provision AWS infrastructure and automatically deploy a Dockerized NGINX application.

The entire setup is fully automated — no manual installation required.

---

## 🛠️ Technologies Used

* Terraform
* AWS EC2
* AWS VPC & Security Groups
* Docker
* NGINX
* Docker Hub

---

## ⚙️ What This Project Does

✅ Provisions an Ubuntu EC2 instance using Terraform
✅ Configures Security Group (SSH - 22, HTTP - 80)
✅ Installs Docker automatically using user_data
✅ Pulls and runs NGINX container
✅ Exposes port 80 to access via Public IP
✅ Creates custom Docker image
✅ Pushes image to Docker Hub

---

## 🏗️ Infrastructure Architecture

User → Browser → EC2 Public IP → Docker → NGINX Container

---

## 📂 Project Structure

```
.
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── README.md
```

---

## 🚀 Deployment Steps

### 1️⃣ Initialize Terraform

```
terraform init
```

### 2️⃣ Preview Changes

```
terraform plan
```

### 3️⃣ Apply Configuration

```
terraform apply
```

### 4️⃣ Access Application

Open in browser:

```
http://<EC2-Public-IP>
```

---

## 🐳 Docker Commands Used (Validation)

```
docker ps
docker inspect nginx-container
docker logs nginx-container
docker commit
docker push
```




