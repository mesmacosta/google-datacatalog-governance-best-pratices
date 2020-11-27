# Terraform Configuration

## Run Terraform

### Set terraform execution Service Account
At the moment this guide was created, Data Catalog does not
support using end user credentials from the Google Cloud SDK. So you need to set the service account before running terraform.
```bash
export GOOGLE_CLOUD_PROJECT={project-id}
export SA_NAME=terraform-dc-resources-sa

# Create Service Account
gcloud iam service-accounts create $SA_NAME \
--display-name  "Service Account to create DC Resources" \
--project $GOOGLE_CLOUD_PROJECT 

# Add Tag Template Owner role
gcloud projects add-iam-policy-binding $GOOGLE_CLOUD_PROJECT \
--member "serviceAccount:$SA_NAME@$GOOGLE_CLOUD_PROJECT.iam.gserviceaccount.com" \
--quiet \
--project $GOOGLE_CLOUD_PROJECT \
--role "roles/datacatalog.tagTemplateOwner"
```

### Set terraform execution project
```bash
export GOOGLE_CLOUD_PROJECT={project-id}
```

### Set terraform variable placeholders

Go to [.tvars](terraform/.tfvars) and change the placeholders:

1. `tag_central_project_id` to your Tag Central Project
1. `tag_template_region` to the region you want the sample templates to be created.
1. `datacatalog_data_governor_members` to the list of data governor members split by comma
1. `datacatalog_data_curator_members` to the list of data curator members split by comma
1. `datacatalog_data_analyst_members` to the list of data curator analyst split by comma

Example of a valid configuration:
```text
tag_central_project_id="tag-central-project"

tag_template_region="us"

datacatalog_data_governor_members=["user:john_data_governor@datacompany.com", "group:data_governors@datacompany.com"]

datacatalog_data_curator_members=["user:john_data_curator@datacompany.com", "group:data_curators@datacompany.com"]

datacatalog_data_analyst_members=["user:john_data_analytic@datacompany.com", "group:data_analytics@datacompany.com"]
```

> member can be any of: user:{emailid}, serviceAccount:{emailid}, group:{emailid} or domain:{domain}  

### Init terraform
After that, let's get Terraform started. Run the following to pull in the providers.

```bash
terraform init
```

### Execute terraform
With the providers downloaded and a project set, you're ready to use Terraform. Go ahead!

```bash
terraform plan -input=false -out=tfplan -var-file=".tfvars" 
terraform apply tfplan
```

Terraform will show you what it plans to do, and prompt you to accept. Type "yes" to accept the plan.

```bash
yes
```

## Cleanup

Run the following to remove the resources Terraform provisioned:

```bash
terraform destroy -var-file=".tfvars"
```
```bash
yes
```

