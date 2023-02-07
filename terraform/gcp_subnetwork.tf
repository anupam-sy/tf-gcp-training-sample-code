# Resource block to deploy SubNetworks
resource "google_compute_subnetwork" "tst_vpc01_subnet01" {
  name                     = var.vpc01_subnet01_name
  ip_cidr_range            = var.vpc01_subnet01_cidr
  region                   = var.resource_region
  private_ip_google_access = true
  network                  = google_compute_network.tst_vpc01.id
}