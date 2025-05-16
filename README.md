# Technical Assessment

This repository contains the solution to the technical assessment.

## Problem Statement

The technical assessment consists of two parts:

1.  Write a Python function that takes an array of integers and returns a new array with the product of all numbers except the one at each index.
2.  Deploy a VM from a deployment pipeline, diagnosing and correcting any errors reported by Terraform or Ansible.

## Solution

The solution consists of the following components:

*   `product_array.py`: A Python file that contains the implementation of the Python function.
*   `main.tf`: A Terraform file that defines the infrastructure as code.
*   `variables.tf`: A Terraform file that defines the variables used in the Terraform configuration.
*   `modules/vpc/main.tf`: A Terraform file that defines the VPC network module.
*   `modules/vpc/variables.tf`: A Terraform file that defines the variables used in the VPC network module.
*   `modules/vm/main.tf`: A Terraform file that defines the VM module.
*   `modules/vm/variables.tf`: A Terraform file that defines the variables used in the VM module.
*   `.github/workflows/main.yml`: A GitHub Actions workflow that automates the deployment of the infrastructure.
*   `Dockerfile`: A Dockerfile to containerize the Python function.
*   `docker-compose.yml`: A Docker Compose file to define the services.
*   `.gitignore`: A .gitignore file to exclude files from version control.

## Python Function

The `product_array.py` file contains the implementation of the Python function that takes an array of integers and returns a new array with the product of all numbers except the one at each index. The algorithm has a time complexity of O(n), where n is the number of elements in the array.

Initially, the algorithm used separate loops to calculate the prefix and postfix products. However, this was refactored to use a single loop to improve performance.

The function works by first calculating the product of all numbers in the array. Then, for each number in the array, it divides the product by that number to get the product of all numbers except the one at that index.

## Terraform Configuration

The `main.tf` file defines the infrastructure as code using Terraform. The infrastructure consists of the following resources:

*   A VPC network.
*   A VM.
*   A firewall rule to allow HTTP traffic.

The `variables.tf` file defines the variables used in the Terraform configuration.

The `modules/vpc/main.tf` file defines the VPC network module. The `modules/vpc/variables.tf` file defines the variables used in the VPC network module.

The `modules/vm/main.tf` file defines the VM module. The `modules/vm/variables.tf` file defines the variables used in the VM module.

## GitHub Actions Workflow

The `.github/workflows/main.yml` file defines a GitHub Actions workflow that automates the deployment of the infrastructure. The workflow consists of the following steps:

1.  Checkout the code.
2.  Set up Terraform.
3.  Authenticate to Google Cloud.
4.  Initialize Terraform.
5.  Apply Terraform.

## Instructions

To use the Terraform configuration, you will need to have the following:

*   A Google Cloud account.
*   The gcloud command-line tool installed and configured.
*   Terraform installed.

To deploy the infrastructure, you will need to do the following:

1.  Set the `GCP_CREDENTIALS` secret in GitHub.
2.  Set the `GCP_BUCKET_NAME` secret in GitHub.
3.  Run the GitHub Actions workflow.

## Docker and Docker Compose

To run the application using Docker and Docker Compose, you will need to have the following:

*   Docker installed.
*   Docker Compose installed.

To run the application, you will need to do the following:

1.  Build the Docker image:

    ```bash
    docker-compose build
    ```

2.  Run the Docker container:

    ```bash
    docker-compose up
    ```

## Security Best Practices

The following security best practices have been implemented:

*   A firewall is used to allow HTTP traffic.
*   OS Login is enabled to centrally manage access to VMs using IAM roles.

## SRE Considerations

The following SRE considerations have been taken into account:

*   Monitoring and logging have been added to the VM.
*   Autoscaling has been implemented to automatically scale the number of VMs based on traffic and demand.
