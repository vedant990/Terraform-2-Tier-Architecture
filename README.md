# Terraform 2-Tier Architecture

[![Terraform](https://img.shields.io/badge/Terraform-0.15.0-blueviolet)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-orange)](https://aws.amazon.com/)

This Terraform configuration sets up a 2-tier architecture in AWS, consisting of a Virtual Private Cloud (VPC), public and private subnets, an Application Load Balancer (ALB), and Amazon RDS.

## Prerequisites

Before you begin, ensure you have:

- [Terraform](https://www.terraform.io/) installed locally.
- Appropriate AWS credentials configured.

## Architecture Overview

The architecture includes:

- **VPC:** A Virtual Private Cloud to isolate resources.
- **Public Subnets:** Where the Application Load Balancer resides.
- **Private Subnets:** For backend resources, such as databases.
- **ALB:** An Application Load Balancer for distributing incoming traffic to backend instances.
- **RDS:** Amazon Relational Database Service for database management.

# Directory Structure

The directory structure of the project is organized as follows:

- **data.tf:** Data configurations for external data sources.
- **loadbalancer.tf:** Configuration for the Application Load Balancer.
- **machine.tf:** Configuration for EC2 instances or other compute resources.
- **network.tf:** Networking configurations including subnets and route tables.
- **provider.tf:** Provider configuration for AWS.
- **subnet.tf:** Specific configurations for subnets.
- **vpc.tf:** Configuration for the Virtual Private Cloud.

## Usage

1. **Clone the repository:**

    ```bash
    [git clone [https://github.com/vedant990/Terraform-2-Tier-Architecture.git]
    cd terraform-2-tier-architecture
    ```

2. **Initialize Terraform:**

    ```bash
    terraform init
    ```

3. **Adjust variables in `terraform.tfvars` as needed.**

4. **Apply the Terraform configuration:**

    ```bash
    terraform apply
    ```

## Clean-Up

To destroy the created infrastructure, run:

```bash
terraform destroy
