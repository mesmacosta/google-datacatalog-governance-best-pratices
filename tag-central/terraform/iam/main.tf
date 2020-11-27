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

locals {
  # Analytics projects for each data governor member
  iam_data_governor_dc_analytics_obj = flatten([
    for datacatalog_analytic_project_id in var.datacatalog_analytics_projects_id : [
      for datacatalog_data_governor_member in var.datacatalog_data_governor_members : {
        dc_analytic_project_id       = datacatalog_analytic_project_id
        dc_member       = datacatalog_data_governor_member
      }
    ]
  ])

  # Analytics projects for each data curator member
  iam_data_curator_dc_analytics_obj = flatten([
    for datacatalog_analytic_project_id in var.datacatalog_analytics_projects_id : [
      for datacatalog_data_curator_member in var.datacatalog_data_curator_members : {
        dc_analytic_project_id       = datacatalog_analytic_project_id
        dc_member       = datacatalog_data_curator_member
      }
    ]
  ])

  # Analytics projects for each data analytics member
  iam_data_analytics_dc_analytics_obj = flatten([
    for datacatalog_analytic_project_id in var.datacatalog_analytics_projects_id : [
      for datacatalog_data_analyst_member in var.datacatalog_data_analyst_members : {
        dc_analytic_project_id       = datacatalog_analytic_project_id
        dc_member       = datacatalog_data_analyst_member
      }
    ]
  ])
}

# ADD IAM Roles for the Tag Central project
resource "google_project_iam_member" "google_tag_central_project_iam_member_data_governors" {
  for_each = toset(var.datacatalog_data_governor_members)
  member  = each.value
  project = var.tag_central_project_id
  role    = "roles/datacatalog.admin"
}

resource "google_project_iam_member" "google_tag_central_project_iam_member_data_curators_dc_viwer" {
  for_each = toset(var.datacatalog_data_curator_members)
  member  = each.value
  project = var.tag_central_project_id
  role    = "roles/datacatalog.viewer"
}

resource "google_project_iam_member" "google_tag_central_project_iam_member_data_curators_tag_template_user" {
  for_each = toset(var.datacatalog_data_curator_members)
  member  = each.value
  project = var.tag_central_project_id
  role    = "roles/datacatalog.tagTemplateUser"
}

resource "google_project_iam_member" "google_tag_central_project_iam_member_data_analyst" {
  for_each = toset(var.datacatalog_data_analyst_members)
  member  = each.value
  project = var.tag_central_project_id
  role    = "roles/datacatalog.viewer"
}

# ADD IAM Roles for the Analytics project
resource "google_project_iam_member" "google_analytics_project_iam_member_data_governors" {
  for_each = {
    for iam_obj in local.iam_data_governor_dc_analytics_obj : "${iam_obj.dc_analytic_project_id}.${iam_obj.dc_member}" => iam_obj
  }
  
  member  = each.value.dc_member
  project = each.value.dc_analytic_project_id
  role    = "roles/datacatalog.admin"
}

resource "google_project_iam_member" "google_analytics_project_iam_member_data_curators_dc_viwer" {
  for_each = {
    for iam_obj in local.iam_data_curator_dc_analytics_obj : "${iam_obj.dc_analytic_project_id}.${iam_obj.dc_member}" => iam_obj
  }

  member  = each.value.dc_member
  project = each.value.dc_analytic_project_id
  role    = "roles/datacatalog.viewer"
}

resource "google_project_iam_member" "google_analytics_project_iam_member_data_curators_dc_tag_editor" {
  for_each = {
    for iam_obj in local.iam_data_curator_dc_analytics_obj : "${iam_obj.dc_analytic_project_id}.${iam_obj.dc_member}" => iam_obj
  }

  member  = each.value.dc_member
  project = each.value.dc_analytic_project_id
  role    = "roles/datacatalog.tagEditor"
}

resource "google_project_iam_member" "google_analytics_project_iam_member_data_analyst" {
  for_each = {
    for iam_obj in local.iam_data_analytics_dc_analytics_obj : "${iam_obj.dc_analytic_project_id}.${iam_obj.dc_member}" => iam_obj
  }

  member  = each.value.dc_member
  project = each.value.dc_analytic_project_id
  role    = "roles/datacatalog.viewer"
}