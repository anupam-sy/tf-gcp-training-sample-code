# Resource block to deploy Service Account
resource "google_service_account" "tst_vm01_svcacc" {
  display_name = "${var.gce01_name}-service-account"
  account_id   = "${var.gce01_name}-service-account"
  description  = "A service account that only ${var.gce01_name} can use."
}

# Resource block to provide access to service account
resource "google_project_iam_member" "tst_vm01_role" {
  project = var.project_id
  role    = "roles/secretmanager.viewer"
  member  = "serviceAccount:${google_service_account.tst_vm01_svcacc.email}"
}