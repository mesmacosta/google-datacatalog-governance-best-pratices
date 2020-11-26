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

resource "google_data_catalog_tag_template" "data_eng_template" {
  tag_template_id = "data_eng_template"
  region = var.tag_template_region
  display_name = "Data Engineering Template"

  fields {
    field_id = "source_col"
    display_name = "Source Column"
    type {
      primitive_type = "STRING"
    }
    is_required = true
  }

  fields {
    field_id = "source_table"
    display_name = "Source Table"
    type {
      primitive_type = "STRING"
    }
    is_required = true
  }

  fields {
    field_id = "pk_col"
    display_name = "Primary Key Column"
    type {
      primitive_type = "BOOL"
    }
  }

  fields {
    field_id = "fk_col"
    display_name = "Foreign Key Column"
    type {
      primitive_type = "BOOL"
    }
  }

  fields {
    field_id = "incr_col"
    display_name = "Incremental Column"
    type {
      primitive_type = "BOOL"
    }
  }

  fields {
    field_id = "null_col"
    display_name = "Field can be NULL"
    type {
      primitive_type = "BOOL"
    }
  }

  fields {
    field_id = "updatable_col"
    display_name = "Field can be updated"
    type {
      primitive_type = "BOOL"
    }
  }

  force_delete = "false"
}

resource "google_data_catalog_tag_template" "derived_data_template" {
  tag_template_id = "derived_data_template"
  region = var.tag_template_region
  display_name = "Derived Data Template"

  fields {
    field_id = "parents"
    display_name = "Parent Data Sources"
    type {
      primitive_type = "STRING"
    }
  }

  fields {
    field_id = "aggregated_data"
    display_name = "Aggregated Dat"
    type {
      primitive_type = "BOOL"
    }
  }

  fields {
    field_id = "pseudo_anonymized_data"
    display_name = "Pseudo Anonymized Data"
    type {
      primitive_type = "BOOL"
    }
  }

  fields {
    field_id = "anonymized_data"
    display_name = "Anonymized Data"
    type {
      primitive_type = "BOOL"
    }
  }

  fields {
    field_id = "normalized_data"
    display_name = "Normalized Data"
    type {
      primitive_type = "BOOL"
    }
  }

  fields {
    field_id = "date_created"
    display_name = "Date Created"
    type {
      primitive_type = "TIMESTAMP"
    }
  }

  fields {
    field_id = "product_created"
    display_name = "Product Used to Create Derived Data"
    type {
      enum_type {
        allowed_values {
          display_name = "BIG_QUERY"
        }
        allowed_values {
          display_name = "DATAFLOW"
        }
        allowed_values {
          display_name = "COMPOSER"
        }
        allowed_values {
          display_name = "CLOUD FUNCTION"
        }
      }
    }
  }

  force_delete = "false"
}

resource "google_data_catalog_tag_template" "data_governance_template" {
  tag_template_id = "data_governance_template"
  region = var.tag_template_region
  display_name = "Data Governance Template"

  fields {
    field_id = "data_domain"
    display_name = "Data Domain"
    type {
      enum_type {
        allowed_values {
          display_name = "ENG"
        }
        allowed_values {
          display_name = "PRODUCT"
        }
        allowed_values {
          display_name = "OPS"
        }
        allowed_values {
          display_name = "LOGISTICS"
        }
        allowed_values {
          display_name = "FINANCE"
        }
        allowed_values {
          display_name = "HR"
        }
        allowed_values {
          display_name = "MARKETING"
        }
        allowed_values {
          display_name = "SALES"
        }                  
      }
    }
  }

  fields {
    field_id = "broad_data_category"
    display_name = "Broad Data Category"
    type {
      enum_type {
        allowed_values {
          display_name = "CONTENT"
        }
        allowed_values {
          display_name = "METADATA"
        }
        allowed_values {
          display_name = "CONFIGURATION"
        }                  
      }
    }
  }  

  fields {
    field_id = "data_category_customer"
    display_name = "Data Category Customer"
    type {
      primitive_type = "BOOL"
    }
  }

  fields {
    field_id = "data_category_location"
    display_name = "Data Category Location"
    type {
      primitive_type = "BOOL"
    }
  }

  fields {
    field_id = "data_category_financial"
    display_name = "Data Category Financial"
    type {
      primitive_type = "BOOL"
    }
  } 

  fields {
    field_id = "data_category_employee"
    display_name = "Data Category Employee"
    type {
      primitive_type = "BOOL"
    }
  }

  fields {
    field_id = "data_category_hippa"
    display_name = "Data Category Health"
    type {
      primitive_type = "BOOL"
    }
  }

  fields {
    field_id = "data_category_competitor"
    display_name = "Data Category Competitor"
    type {
      primitive_type = "BOOL"
    }
  }

  fields {
    field_id = "data_confidentiality"
    display_name = "Data Confidentiality"
    type {
      enum_type {
        allowed_values {
          display_name = "PUBLIC"
        }
        allowed_values {
          display_name = "SHARED_EXTERNALLY"
        }
        allowed_values {
          display_name = "SHARED_INTERNALLY"
        }
        allowed_values {
          display_name = "SENSITIVE"
        }
        allowed_values {
          display_name = "UNKNOWN"
        }        
      }
    }
  }

  fields {
    field_id = "environment"
    display_name = "Environment"
    type {
      enum_type {
        allowed_values {
          display_name = "PROD"
        }
        allowed_values {
          display_name = "QA"
        }
        allowed_values {
          display_name = "DEV"
        }
        allowed_values {
          display_name = "STAGING"
        }       
      }
    }
  }

  fields {
    field_id = "data_origin"
    display_name = "Data Origin"
    type {
      enum_type {
        allowed_values {
          display_name = "WORKDAY"
        }
        allowed_values {
          display_name = "SALESFORCE"
        }
        allowed_values {
          display_name = "DATA_LAKE"
        }
        allowed_values {
          display_name = "EVENT"
        }
        allowed_values {
          display_name = "PROMOTION"
        }
        allowed_values {
          display_name = "PARTNER"
        }
        allowed_values {
          display_name = "CONTRACTOR"
        }
        allowed_values {
          display_name = "OPEN_DATA"
        }
      }
    }
  }

  fields {
    field_id = "data_creation"
    display_name = "Data Creation Time"
    type {
      primitive_type = "TIMESTAMP"
    }
  }

  fields {
    field_id = "data_retention"
    display_name = "Data Retention"
    type {
      enum_type {
        allowed_values {
          display_name = "30_DAYS"
        }
        allowed_values {
          display_name = "60_DAYS"
        }
        allowed_values {
          display_name = "90_DAYS"
        }
        allowed_values {
          display_name = "120_DAYS"
        }
        allowed_values {
          display_name = "1_YEAR"
        }
        allowed_values {
          display_name = "2_YEARS"
        }
        allowed_values {
          display_name = "5_YEARS"
        }
        allowed_values {
          display_name = "UNKNOWN"
        }
      }
    }
  }  

  force_delete = "false"
}

resource "google_data_catalog_tag_template" "data_quality_template" {
  tag_template_id = "data_quality_template"
  region = var.tag_template_region
  display_name = "Data Quality Template"

  fields {
    field_id = "count"
    display_name = "Number of Values"
    type {
      primitive_type = "DOUBLE"
    }
  }

  fields {
    field_id = "unique_values"
    display_name = "Number of Unique Values"
    type {
      primitive_type = "DOUBLE"
    }
  }

  fields {
    field_id = "percent_missing"
    display_name = "Percentage Missing Values"
    type {
      primitive_type = "DOUBLE"
    }
  }

  fields {
    field_id = "mean"
    display_name = "Mean Value"
    type {
      primitive_type = "DOUBLE"
    }
  }

  fields {
    field_id = "std_dev"
    display_name = "Standard Deviation"
    type {
      primitive_type = "DOUBLE"
    }
  }

  fields {
    field_id = "zeros"
    display_name = "Number of Zero Values"
    type {
      primitive_type = "DOUBLE"
    }
  }

  fields {
    field_id = "min"
    display_name = "Min Value"
    type {
      primitive_type = "DOUBLE"
    }
  }

  fields {
    field_id = "median"
    display_name = "Median Value"
    type {
      primitive_type = "DOUBLE"
    }
  }

  fields {
    field_id = "max"
    display_name = "Max Value"
    type {
      primitive_type = "DOUBLE"
    }
  }

  fields {
    field_id = "date_created"
    display_name = "Date Created"
    type {
      primitive_type = "TIMESTAMP"
    }
  }  

  force_delete = "false"
}