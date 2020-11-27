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

resource "google_project_service" "project_services_tag_central" {
  project  = var.tag_central_project_id
  service = "datacatalog.googleapis.com"
  disable_on_destroy = false
}

module "iam" {
  source = "./iam"
  tag_central_project_id      = var.tag_central_project_id
  datacatalog_analytics_projects_id      = var.datacatalog_analytics_projects_id
  datacatalog_data_governor_members = var.datacatalog_data_governor_members
  datacatalog_data_curator_members = var.datacatalog_data_curator_members
  datacatalog_data_analyst_members = var.datacatalog_data_analyst_members  
}

module "data_catalog_tag_template" {
  source = "./data_catalog_tag_template"
  tag_central_project_id      = var.tag_central_project_id
  tag_template_region = var.tag_template_region
  datacatalog_resources_sa_name = var.datacatalog_resources_sa_name
}

