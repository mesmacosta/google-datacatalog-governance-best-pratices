# Terraform Configuration

## Run Terraform

### Set terraform execution project
```bash
export GOOGLE_CLOUD_PROJECT={{project-id}}
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
terraform apply
```

Terraform will show you what it plans to do, and prompt you to accept. Type "yes" to accept the plan.

```bash
yes
```


## Post-Apply

### Editing your config

Now you've provisioned your resources in GCP! If you run a "plan", you should see no changes needed.

```bash
terraform plan
```

So let's make a change! Try editing a number, or appending a value to the name in the editor. Then,
run a 'plan' again.

```bash
terraform plan
```

Afterwards you can run an apply, which implicitly does a plan and shows you the intended changes
at the 'yes' prompt.

```bash
terraform apply
```

```bash
yes
```

## Cleanup

Run the following to remove the resources Terraform provisioned:

```bash
terraform destroy
```
```bash
yes
```

