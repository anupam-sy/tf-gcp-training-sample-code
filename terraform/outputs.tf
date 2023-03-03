// Resource outputs
output "tst_vpc_id" {
  value       = google_compute_network.tst_vpc.id
  description = "The ID of the created vpc network."
}

output "tst_subnet_id" {
  value       = google_compute_subnetwork.tst_subnet.id
  description = "The ID of the created subnetwork."
}