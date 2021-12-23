# Resource block to reserve regional External IP Address for VM
resource "google_compute_address" "tst_vm01_eip" {
  project = var.project_id

  name         = "${var.gce01_name}-eip"
  region       = var.resource_region
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
}

# Resource block to reserve static Internal IP Address
resource "google_compute_address" "tst_vm01_iip" {
  project = var.project_id

  name         = join("", [var.gce01_name, "-iip"])
  region       = var.resource_region
  address_type = "INTERNAL"
  address      = "10.0.40.2"
  subnetwork   = google_compute_subnetwork.tst_vpc01_subnet01.id
}