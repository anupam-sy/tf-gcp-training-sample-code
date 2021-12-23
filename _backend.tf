# Configure Google Cloud Storage (GCS) Backend for Google Cloud Provider
terraform {
  backend "gcs" {
    bucket      = "tfstates"
    prefix      = "workload/tst"
    credentials = "<<key_file_path>>"
  }
}