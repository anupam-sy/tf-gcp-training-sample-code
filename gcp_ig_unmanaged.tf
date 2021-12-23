# Resource block to create Unmanaged Instance Group
resource "google_compute_instance_group" "tst_umig01" {
  project = var.project_id

  name      = var.umig01_name
  zone      = var.resource_zone
  network   = google_compute_network.tst_vpc01.id
  instances = [resource.google_compute_instance.tst_vm01.self_link]

  named_port {
    name = "http"
    port = 80
  }
}