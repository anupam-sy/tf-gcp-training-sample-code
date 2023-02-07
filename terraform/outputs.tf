# Virtual Network ID
output "tst_vpc01_id" {
  value = google_compute_network.tst_vpc01.id
}

# Subnetwork ID
output "tst_vpc01_subnet01_id" {
  value = google_compute_subnetwork.tst_vpc01_subnet01.id
}

