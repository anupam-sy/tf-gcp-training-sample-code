# Resource block to deploy SubNetworks
resource "google_compute_subnetwork" "tst_subnet" {
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_cidr
  region                   = var.default_region
  private_ip_google_access = true
  network                  = google_compute_network.tst_vpc.id
}