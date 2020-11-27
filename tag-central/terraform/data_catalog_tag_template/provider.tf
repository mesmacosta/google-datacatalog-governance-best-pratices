/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

provider "google" {
  version = "~> 3.27.0"
  alias   = "tokengen"
}

locals {
  datacatalog_resources_sa_email = "${var.datacatalog_resources_sa_name}@${var.tag_central_project_id}.iam.gserviceaccount.com"
}

data "google_client_config" "default" {
  provider = google.tokengen
}

data "google_service_account_access_token" "sa" {
  provider               = google.tokengen
  target_service_account = local.datacatalog_resources_sa_email
  lifetime               = "60s"
scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
  ]
}

provider "google" {
  version = "~> 3.27.0"
  access_token = data.google_service_account_access_token.sa.access_token
  alias = "access_token"
  project      = var.tag_central_project_id
}