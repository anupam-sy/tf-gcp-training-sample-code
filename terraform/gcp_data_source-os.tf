# Data block to get the OS Image self link
data "google_compute_image" "dev_rhel_7" {
  family  = "rhel-7"
  project = "rhel-cloud"
}