# File to configure terraform backend

# Set backend to GCS
terraform {
 backend "gcs" {
   prefix  = "develop"
 }
}