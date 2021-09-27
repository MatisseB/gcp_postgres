# Main file - Posgresql ressources definition
# Note: All variable are explained in the variables.tf


#  Defining default private network
data "google_compute_network" "default" {
  name = var.network
}

# Enable Sqladmin API service
resource "google_project_service" "enable_sqladmin_api" {
  service            = "sqladmin.googleapis.com"
  disable_on_destroy = false
}

# Postgresql Instance Definition
resource "google_sql_database_instance" "postgresql_instance" {
  name                = "postgresql-${var.environment}" # - random
  database_version    = var.postgres_version
  deletion_protection = var.deletion_protection

  settings {
    tier              = var.instance_tier
    availability_type = var.availability_type

    backup_configuration {
      enabled                        = true
      start_time                     = var.backup_start_time
      point_in_time_recovery_enabled = var.point_in_time_recovery
      location                       = var.backup_location
    }

    maintenance_window {
      day  = var.maintenance_window_day
      hour = var.maintenance_window_hour
      update_track = var.update_track
    }

    dynamic "database_flags" {
      for_each = var.database_flags
      content {
        name  = database_flags.key
        value = database_flags.value
      }
    }

    ip_configuration {
      private_network = var.private_ip ? data.google_compute_network.default.self_link : null
      ipv4_enabled    = var.public_ip? true : false

      dynamic "authorized_networks" {
        for_each = var.authorized_networks
        content {
          name  = authorized_networks.value.name
          value = authorized_networks.value.cidr
        }
      }
    }
  }
}

resource "random_password" "postgres_default" {
  length           = var.password_length
  special          = true
  override_special = "/@_%"
}

resource "google_sql_user" "default" {
  name       = var.postgres_database_user
  instance   = google_sql_database_instance.postgresql_instance.name
  password   = random_password.postgres_default.result
  depends_on = [google_sql_database_instance.postgresql_instance]
}

resource "google_sql_database" "default" {
  name       = var.postgres_database_name
  instance   = google_sql_database_instance.postgresql_instance.name
  charset    = "UTF8"
  collation  = "en_US.UTF8"
  depends_on = [google_sql_database_instance.postgresql_instance]
}