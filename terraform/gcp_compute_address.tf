# Resource block to reserve regional external IP address for webserver compute engine
resource "google_compute_address" "tst_webserver_eip" {
  project      = var.project_id
  name         = "${var.gce_name}-eip"
  region       = var.default_region
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
}

// Resource block to reserve static internal IP address in subnet
resource "google_compute_address" "tst_webserver_iip" {
  project      = var.project_id
  name         = join("", [var.gce_name, "-iip"])
  region       = var.default_region
  address_type = "INTERNAL"
  address      = "10.0.40.2"
  subnetwork   = google_compute_subnetwork.tst_subnet.id
}