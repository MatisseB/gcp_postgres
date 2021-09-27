# Technical test - Deploy Postgresql on GCP with Terraform

# Call module postgre
module "gcp_postgres" {
    # Path to the module
    source = "./modules/postgres"

    # Variables to pass to module - Add if needed
    # Project, Region and Zone are set by default via Google provider
    environment = var.environment
    
    postgres_version = "POSTGRES_12"
    backup_start_time = "04:00"
    password_length = 16
}