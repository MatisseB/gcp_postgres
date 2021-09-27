# File for terraform providers version managment

terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 3.8.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}