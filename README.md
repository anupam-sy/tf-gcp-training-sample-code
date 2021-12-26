# Terraform Code
This repository contains terraform code for Infrastructure Components* deployment on Google Cloud Platform.

## Prerequisites:
Below prerequisites must be fulfilled for successful execution of code.

### Software Requirement:
Resources in this repository are meant for use with Terraform 1.0.0 (Check the version using `terraform --version`). If you don't have the compatible version, download it from official Terraform repository.

-   [gcloud sdk](https://cloud.google.com/sdk/install) >= 332.0.0
-   [Terraform](https://www.terraform.io/downloads.html) >= 1.0.0
-   [terraform-provider-google] plugin = 3.60.0
-   [terraform-provider-google-beta] plugin = 3.60.0

### Permissions Requirement:
In order to execute these templates you must have a Service Account with the following roles. Access can be more fine-grained to follow Principle of least privilege (PoLP).

- `roles/resourcemanager.projectOwner` on all the projects where you want to house your resources using service account's email.
- `roles/storage.admin` on the project housing terraform state files, If leveraging Standard GCS Backend.

### Project API Requirement:
In order to use the services, required APIs must be enabled before resource deployment. Enable all the requried APIs using below mentioned gcloud command. Example below -

	gcloud services enable servicenetworking.googleapis.com \
	    cloudresourcemanager.googleapis.com \
	    compute.googleapis.com \
	    iam.googleapis.com

### Standard Backend Setup:
To use a standard gcs backend, create a GCS Bucket and set the versioning. Use below gcloud commands.

    gcloud config set project PROJECT_ID
	gsutil mb -c standard -l eu gs://bucket-name
	gsutil versioning set on gs://bucket-name

## Execution:
To execute the Terraform code, go to command prompt and change the directory to your terraform configuration directory and then execute the following commands:

-   Run `[Required] terraform init` to initialize the terraform working directory containing configuration files.
-   Run `[Optional] terraform validate` to check whether configuration is syntactically valid and internally consistent.
-   Run `[Optional] terraform fmt` to rewrite Terraform configuration files to a canonical format and style.
-   Run `[Optional] terraform plan` to preview the execution plan.
-   Run `[Required] terraform apply` to execute the actions proposed in a Terraform plan.
-   Run `[Optional] terraform destroy` to destory the resources defined in your Terraform configuration.

## Infrastructure Components:
Below mentioned resources will be deployed post successful execution of Terraform Code.

1) VPC
2) Subnet
3) Firewall
4) Public and Private IP
5) Compute Disk
6) Service Account
7) Compute Engine
8) Unmanaged Instance Group
