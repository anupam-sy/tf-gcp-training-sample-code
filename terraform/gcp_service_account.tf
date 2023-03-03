// Locals block to transform and construct values
locals {
  svcacc_roles = [
    "roles/storage.objectViewer",
    "roles/compute.networkAdmin"
  ]
}

// Resource block to deploy Service Account
resource "google_service_account" "tst_webserver_svcacc" {
  display_name = "${var.gce_name}-service-account"
  account_id   = "${var.gce_name}-service-account"
  description  = "A service account to attach with webserver instance"
}

// Resource block to provide access to service account
resource "google_project_iam_member" "tst_webserver_svcacc_iam" {
  for_each = toset(local.svcacc_roles)

  project = var.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.tst_webserver_svcacc.email}"
}