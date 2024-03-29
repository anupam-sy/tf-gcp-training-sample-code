// Data block to get the os image self link
data "google_compute_image" "dev_rhel_7" {
  family  = "rhel-7"
  project = "rhel-cloud"
}

// Resoure block to deploy google compute engine
resource "google_compute_instance" "tst_webserver" {
  project      = var.project_id
  name         = var.gce_name
  zone         = var.default_zone
  machine_type = var.gce_machine_type

  # If true, allows Terraform to stop the instance to update its properties.
  allow_stopping_for_update = true

  # Disk section configurations
  boot_disk {
    auto_delete = true
    mode        = "READ_WRITE"

    initialize_params {
      size  = 50
      type  = "pd-standard"
      image = data.google_compute_image.dev_rhel_7.self_link
    }
  }

  attached_disk {
    source = google_compute_disk.tst_webserber_data_disk.self_link
    mode   = "READ_WRITE"
  }

  # Identity and API access configurations
  service_account {
    email  = google_service_account.tst_webserver_svcacc.email
    scopes = ["cloud-platform"]
  }

  # Management Section configurations
  labels              = var.resource_labels
  deletion_protection = false

  metadata_startup_script = file("${path.module}/scripts/install_httpd.sh")
  /*
  metadata = {
    # enable-oslogin     = "TRUE"
    startup-script-url = "https://storage.cloud.google.com/foundation-scripts-bucket/startup.sh"
  }
  */

  scheduling {
    preemptible         = false
    on_host_maintenance = "MIGRATE"
    automatic_restart   = true
  }

  # Security Section configurations
  # This feature can only be used with boot images with shielded vm support.
  shielded_instance_config {
    enable_secure_boot          = false
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  # Networking Section configurations
  # NIC Card(s) to be used with Virtual Machines
  network_interface {
    subnetwork         = google_compute_subnetwork.tst_subnet.name
    subnetwork_project = var.project_id
    network_ip         = google_compute_address.tst_webserver_iip.address

    access_config {
      nat_ip = google_compute_address.tst_webserver_eip.address
    }
  }
  tags           = ["web", "linux"]
  can_ip_forward = false
}