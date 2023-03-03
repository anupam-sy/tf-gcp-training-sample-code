// Variables declaration
variable "project_id" {
  type        = string
  description = "The ID of the google project to house the resources."
}

variable "default_region" {
  type        = string
  description = "The default region to create the google cloud regional resources."
}

variable "default_zone" {
  type        = string
  description = "The default zone to create the google cloud zonal resources."
}

variable "resource_labels" {
  description = "The labels to be associated with created resources."
  type        = map(string)
  default = {
    "env"     = "test"
    "buildby" = "anupam"
    "project" = "mgcp-foundation"
  }
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC network being created."
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnetwork being created."
}

variable "subnet_cidr" {
  type        = string
  description = "The cidr range of the subnetwork being created."
}

variable "gce_name" {
  type        = string
  description = "The name of the google compute engine being created."
}

variable "gce_machine_type" {
  type        = string
  description = "The machine type for the google compute engine."
  default     = "e2-medium"
}

variable "umig_name" {
  type        = string
  description = "The name of the unmanaged instance group being created."
}