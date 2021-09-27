# File to define variables needed for the project

##### Google Cloud Platform #####
variable "gcp_project" {
  description = "The default project"
  type        = string
}

variable "gcp_region" {
  description = "The default region"
  default     = "europe-west1"
  type        = string
}

variable "gcp_zone" {
  description = "The default zone"
  default     = "europe-west1-a"
  type        = string
}

##### Misc #####
variable "environment" {
  description = "Project enviroment (production / development / ... )"
  type        = string
}