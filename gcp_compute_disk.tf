# Resource block to deploy zonal persistant disk
resource "google_compute_disk" "tst_vm01_data_disk01" {
  project = var.project_id

  name   = "${var.gce01_name}-data-disk-01"
  zone   = var.resource_zone
  type   = "pd-standard"
  size   = 10
  labels = var.resource_labels
}