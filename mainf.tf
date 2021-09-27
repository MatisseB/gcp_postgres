# Technical test - Deploy Postgresql on GCP with Terraform

# Call module postgre
module "gcp_postgres" {
    # Path to the module
    source = "./modules/postgres"

    # Variables to pass to module - Add if needed
    # Project, Region and Zone are set by default via Google provider
    environment = var.environment

    
    # add some default variables
}