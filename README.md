## Threat Composer ECS Deployment

This project demonstrates a fully automated DevOps pipeline that deploys a containerized Node.js application to **AWS ECS Fargate** using **Terraform, Docker, and GitHub Actions**.
Terraform provisions the AWS infrastructure, Docker packages the application, and GitHub Actions builds the image, pushes it to **Amazon ECR**, and deploys it automatically to ECS behind an **Application Load Balancer**.

![AWS](https://img.shields.io/badge/AWS-ECS-orange)
![Terraform](https://img.shields.io/badge/Terraform-IaC-purple)
![Docker](https://img.shields.io/badge/Docker-Container-blue)
![GitHub Actions](https://img.shields.io/badge/CI/CD-GitHub_Actions-black)

## Key Features

- Infrastructure as Code using **Terraform**
- Containerized Node.js application using **Docker**
- Automated **CI/CD pipeline** with GitHub Actions
- Secure container storage using **Amazon ECR**
- Highly available deployment on **AWS ECS Fargate**
- Application exposed through **AWS Application Load Balancer**
- Automated infrastructure teardown with Terraform

## Architecture
Diagram:
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/9a21043e-d8af-4915-9540-b92171d85135" />


The application is deployed using the following AWS services:

- Amazon ECS (Fargate) – container orchestration
- Amazon ECR – container image registry
- Application Load Balancer – traffic routing
- Route53 – DNS management
- AWS ACM – SSL/TLS certificates
- CloudWatch Logs – container logging
- Terraform – infrastructure as code
- GitHub Actions – CI/CD automation

Deployment Flow:

Developer Push → GitHub Actions → Docker Build → ECR Push → ECS Service Update → ALB → Running App


## Project Structure

```
threat-composer-ecs
│
├── app/
│   ├── Dockerfile
│   ├── package.json
│   └── server.js
│
├── terraform/
│   ├── bootstrap/
│   │   ├── main.tf
│   │   └── outputs.tf
│   │
│   └── deployment/
│       └── environments/
│           └── dev/
│               ├── main.tf
│               ├── variables.tf
│               └── outputs.tf
│
└── .github/workflows/
    └── deploy.yml
```
### Deployed Application

Screenshot of the deployed app.

<img width="564" height="482" alt="Threat Composer ECS App Running" src="https://github.com/user-attachments/assets/aa0f53a5-1532-41af-b02c-c1c4674ea929" />

---

## Docker Container

The application is packaged as a lightweight Node.js container.

Key Docker configuration:
```
FROM node:20-alpine
WORKDIR /app
COPY package.json .
COPY server.js .
EXPOSE 3000
CMD ["npm","start"]
```
The container image is built locally and pushed to Amazon ECR via GitHub Actions.

### Docker Image

Screenshot of the Docker image used to run the application.

<img width="564" height="482" alt="Docker Threat Composer Image" src="https://github.com/user-attachments/assets/ef79974b-3250-4303-9874-b2df24211847" />

---

## CI/CD Pipeline

GitHub Actions automates deployment.

Pipeline steps:

1.Checkout repository

2.Authenticate to AWS

3. Build Docker image

4. Push image to Amazon ECR

5. Trigger ECS service update


Workflow trigger:

on:
  push:
    branches:
      - main

This enables automatic deployments on every push.

### CI/CD Pipeline

Screenshot of the GitHub Actions workflow that builds the Docker image and deploys it to AWS ECS.

<img width="1237" height="612" alt="GitHub Actions ECS Deployment Pipeline" src="https://github.com/user-attachments/assets/95520693-08dc-49ef-bcd1-60add7121c50" />


## Application Deployment

The application runs on AWS ECS Fargate behind an Application Load Balancer.

Example output from the running application:

Threat Composer ECS App Running
```
User → ALB → ECS Service → Fargate Container → Node App
```
## Terraform Infrastructure

Terraform provisions the following resources:

- VPC

- Public & Private Subnets

- Internet Gateway

- NAT Gateway

- Security Groups

- ECS Cluste

- ECS Task Definition

- ECS Service

- Application Load Balancer

- Target Group

- Route53 DNS

- ACM SSL certificate

- CloudWatch Logs

- ECR repository


Terraform also configures:

- Remote state in S3

- State locking using DynamoD
  
- Deployment

## Clone the repository:

git clone https://github.com/SuheyrM/threat-composer-ecs.git

Initialize Terraform:
```
terraform init
```
Deploy infrastructure:

```
terraform apply
```
Push application code to trigger CI/CD deployment.

Destroy Infrastructure

To remove all AWS resources:

```
terraform destroy
```
This project demonstrates full infrastructure lifecycle management.

## Future Improvements

Add Kubernetes (EKS) deployment

Implement blue/green deployments

Add container vulnerability scanning

Integrate monitoring with Prometheus/Grafana

Add automated security scanning in CI/CD

