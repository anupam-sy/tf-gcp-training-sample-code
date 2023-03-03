// Resource block to deploy zonal persistant disk
resource "google_compute_disk" "tst_webserber_data_disk" {
  project = var.project_id
  name    = "${var.gce_name}-data-disk-01"
  zone    = var.default_zone
  type    = "pd-standard"
  size    = 10
  labels  = var.resource_labels
}