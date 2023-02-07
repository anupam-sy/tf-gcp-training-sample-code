# Resource block to deploy VPC Network
resource "google_compute_network" "tst_vpc01" {
  project = var.project_id

  name                            = var.vpc01_name
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = false
}