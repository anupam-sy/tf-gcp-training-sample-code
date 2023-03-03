// Resource block to create unmanaged instance group
resource "google_compute_instance_group" "tst_umig" {
  project   = var.project_id
  name      = var.umig_name
  zone      = var.default_zone
  network   = google_compute_network.tst_vpc.id
  instances = [google_compute_instance.tst_webserver.self_link]

  named_port {
    name = "http"
    port = 80
  }
}