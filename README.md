## IoT Device Management Platform

Overview
This project sets up a robust infrastructure on AWS for managing IoT devices, focusing on resource efficiency, cost-effectiveness, and security. It leverages various AWS services, including EC2, RDS, DynamoDB, EFS, CloudWatch, and more, orchestrated with Terraform to ensure infrastructure as code (IaC) principles.

## Prerequisites

AWS Account and AWS CLI configured with access credentials
Terraform installed on your local machine
An SSH key pair for EC2 instance access

## Architecture

Refer to the system architecture diagram provided in the architecture.drawio file within this repository. The diagram visualizes the network setup, including VPCs, subnets, and the relationships between different AWS services used in this project.

## Getting Started

## Clone the Repository

Start by cloning this repository to your local machine.

git clone https://github.com/lokulavdrim/iot-device-management-platform.git
cd iot-device-management-platform
Initialize Terraform
Initialize the Terraform environment to download the required providers.

terraform init

## Configure AWS Credentials

Ensure your AWS credentials are set up correctly by configuring the AWS CLI or setting environment variables.

aws configure

# or

export AWS_ACCESS_KEY_ID="<your-access-key>"
export AWS_SECRET_ACCESS_KEY="<your-secret-key>"

## Plan the Deployment

Review the changes Terraform will perform against your AWS account.

terraform plan

## Deploy the Infrastructure

Apply the Terraform configuration to deploy the infrastructure.

terraform apply
When prompted, review the planned actions and confirm the deployment by typing yes.

## Usage

Accessing the Bastion Host
SSH into the Bastion Host using:

ssh -i /path/to/your-key.pem ec2-user@<Bastion-Host-Public-IP>

## Monitoring and Logging

Utilize AWS CloudWatch for monitoring the infrastructure and viewing logs. Set up alerts for critical metrics and logs.

## CI/CD Pipeline

This project is configured to use AWS CI/CD pipeline for continuous integration and deployment. Follow the steps in ci-cd-setup.md for setting up the pipeline.

## Documentation

Refer to the docs/ directory for additional documentation, including:

system-design.md: Detailed system design and architecture.
runbook.md: Operational procedures and runbook.
ci-cd-setup.md: CI/CD pipeline setup instructions.
