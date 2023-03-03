// Resource block to deploy VPC firewall
resource "google_compute_firewall" "iap_ingress_fw" {
  name      = "allow-ingress-from-iap"
  network   = google_compute_network.tst_vpc.id
  priority  = 300
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }

  source_ranges = ["35.235.240.0/20"]
  target_tags   = []
}

resource "google_compute_firewall" "http_https_ingress_fw" {
  name      = "allow-http-https-inbound"
  network   = google_compute_network.tst_vpc.id
  priority  = 310
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = []
}