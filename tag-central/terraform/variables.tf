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

variable "tag_central_project_id" {
  description = "The ID of the project in which Data Catalog Resources will be stored."
  type        = string
}

variable "tag_template_region" {
  description = "The name of the region used to create the sample Tag Templates."
  type        = string
  default = "us"
}

variable "datacatalog_data_governor_members" {
  description = "List of members that will be granted the Data Governor permissions on Data Catalog. Can be any of: user:{emailid}, serviceAccount:{emailid}, group:{emailid} or domain:{domain}"
  type    = list(string)
}

variable "datacatalog_data_curator_members" {
  description = "List of members that will be granted the Data Curator permissions on Data Catalog. Can be any of: user:{emailid}, serviceAccount:{emailid}, group:{emailid} or domain:{domain}"
  type    = list(string)
}

variable "datacatalog_data_analyst_members" {
  description = "List of members that will be granted the Data Analyst permissions on Data Catalog. Can be any of: user:{emailid}, serviceAccount:{emailid}, group:{emailid} or domain:{domain}"
  type    = list(string)
}

variable "datacatalog_resources_sa_name" {
  description = "Name of the Service Account used to create Data Catalog resources."
  type        = string
}
