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

resource "google_project_iam_member" "google_project_iam_member_data_governors" {
  for_each = toset(var.datacatalog_data_governor_members)
  member  = each.value
  project = var.tag_central_project_id
  role    = "roles/datacatalog.admin"
}

resource "google_project_iam_member" "google_project_iam_member_data_curators_dc_viwer" {
  for_each = toset(var.datacatalog_data_curator_members)
  member  = each.value
  project = var.tag_central_project_id
  role    = "roles/datacatalog.viewer"
}

resource "google_project_iam_member" "google_project_iam_member_data_curators_tag_template_user" {
  for_each = toset(var.datacatalog_data_curator_members)
  member  = each.value
  project = var.tag_central_project_id
  role    = "roles/datacatalog.tagTemplateUser"
}

resource "google_project_iam_member" "google_project_iam_member_data_analyst_dc_viwer" {
  for_each = toset(var.datacatalog_data_analyst_members)
  member  = each.value
  project = var.tag_central_project_id
  role    = "roles/datacatalog.viewer"
}