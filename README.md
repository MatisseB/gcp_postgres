# gcp_postgres
## Note
You will need the GCP Cloud SDK to be able to communicate with Google Cloud APIs.
- [Installation documentation](https://cloud.google.com/sdk/docs/install)

Once installed, you can login with this command:
```
gcloud auth login
```
This will open a window on your browser to login with your Google account.

## From Scratch
This is to configure the GCP project if you don't already have one.

You will need  to set a projectID as you deploy the infrastructure, you can list them with:
```
gcloud projects list
```

Or create one with:
```
gcloud projects create ${TF_ADMIN} \
  --organization ${TF_VAR_org_id} \
  --set-as-default
```

This project use GCS (Google Cloud Storage) to store the state of the infrastructure, you can create a bucket and enable versionning with thoose commands:
```
gsutil mb -p ${TF_ADMIN} gs://sample-terraform-state
gsutil versioning set on gs://sample-terraform-state
```

If not, you will need to activate Gcloud service networking:
```
gcloud services enable servicenetworking.googleapis.com --project=[PSM_PROJECT_NUMBER]
```

Once ready, configure the module variables and deploy your infrastructure:
```
terraform plan -out example.tfplan
terraform apply example.tfplan
```

The provisionning succeed, the password is set as a sensitive information, to retrieve it, juste use:
```
terraform output postgres_default_password
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.8.0 |

## Providers

| Name | 
|------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 
| <a name="requirement_google"></a> [google](#requirement\_google) |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp_postgres"></a> [gcp\_postgres](#module\_gcp\_postgres) | ./modules/postgres | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Project enviroment (production / development / ... ) | `string` | n/a | yes |
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | The default project | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The default region | `string` | `"europe-west1"` | no |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | The default zone | `string` | `"europe-west1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_postgres_default_password"></a> [postgres\_default\_password](#output\_postgres\_default\_password) | PSQL password to default user |
| <a name="output_postgres_instance_connection_name"></a> [postgres\_instance\_connection\_name](#output\_postgres\_instance\_connection\_name) | PSQL instance connection name |
| <a name="output_postgres_instance_ip_settings"></a> [postgres\_instance\_ip\_settings](#output\_postgres\_instance\_ip\_settings) | PSQL instance IP address settings |
| <a name="output_postgres_instance_name"></a> [postgres\_instance\_name](#output\_postgres\_instance\_name) | PSQL instance name |
<!-- END_TF_DOCS -->