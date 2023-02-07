# Variable Declaration - Project, Region, Zone, Labels
variable "project_id" {}
variable "resource_region" {}
variable "resource_zone" {}

variable "resource_labels" {
  description = "Resource Labels"
  default = {
    "env"     = "test"
    "buildby" = "anupam"
    "project" = "mgcp-foundation"
  }
}

# Variable Declaration - IaaS/PaaS/SaaS
variable "vpc01_name" {}
variable "vpc01_subnet01_name" {}
variable "vpc01_subnet01_cidr" {}
variable "gce01_name" {}
variable "gce01_machine_type" {}
variable "umig01_name" {}
