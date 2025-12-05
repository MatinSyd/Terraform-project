# 🍬 Candy Crush Static Website Deployment on AWS using Terraform

This project deploys a **static Candy Crush web application** on AWS using **Terraform**.  
The application is automatically installed on an EC2 instance using Apache (`httpd`) and a GitHub repository clone.

---

## 🚀 Project Overview

This Terraform configuration creates:

- **VPC**
- **Public & Private Subnets**
- **Internet Gateway**
- **NAT Gateway**
- **Route Tables**
- **Security Groups**
- **Load Balancer (ELB)**
- **EC2 Instance (Amazon Linux)**
- **User-Data script to auto-install Apache + clone Candy Crush repo**

Once deployed, accessing the instance or load balancer URL will show the Candy Crush game hosted on Apache.

---

## 📂 Project Structure

```
.
├── Nat.tf
├── asso.tf
├── data.sh
├── data2.sh
├── ec2.tf
├── elb.tf
├── igw.tf
├── key.tf
├── rt.tf
├── sg.tf
├── sub.tf
├── vpc.tf
```

---

## 🧰 Prerequisites

Before deploying:

### **Required Tools**
- Terraform ≥ 1.0
- AWS CLI configured
- Git installed
- AWS IAM user with EC2, VPC, ELB permissions

### **AWS CLI Setup**
```sh
aws configure
```

---

## ⚙️ EC2 User Data Script Used

```bash
#!/bin/bash 
yum update -y 
sudo yum install -y git 
sudo yum install -y httpd
sudo systemctl start httpd 
sudo systemctl enable httpd
git clone https://github.com/Akiranred/candy-crush.git /var/www/html
```

This script installs Apache and deploys the Candy Crush game automatically.

---

# 🚀 Deployment Steps

### **1. Clone this repository**
```sh
git clone <your-repo-url>
cd <project-folder>
```

### **2. Initialize Terraform**
```sh
terraform init
```

### **3. Validate configuration**
```sh
terraform validate
```

### **4. Preview infrastructure**
```sh
terraform plan
```

### **5. Deploy resources**
```sh
terraform apply -auto-approve
```

Terraform will create the full infrastructure and deploy the website.

---

## 🌐 Access the Candy Crush Website

After deployment:

```sh
terraform output
```

You will get:

- **EC2 Public IP**
- **Load Balancer DNS (if configured)**

Open in browser:

```
http://<public-ip>
```

or  

```
http://<load-balancer-dns>
```

---

## 🧹 Destroy All Resources

To avoid AWS costs:

```sh
terraform destroy -auto-approve
```

---

## 📝 Notes

- Ensure port **80** is allowed in your EC2 security group.
- EC2 instance must be in a **public subnet** to access GitHub.
- NAT Gateway required for private subnet internet access.
- The GitHub repo must be public, or else add SSH key authentication.

---

## 🤝 Contributions

Suggestions and improvements are welcome!

