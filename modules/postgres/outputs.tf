# File to define outputs after module execution.
output "postgres_default_password" {
  description = "PSQL password to default user"
  value       = google_sql_user.default.password
}

output "postgres_instance_name" {
  description = "PSQL instance name"
  value       = google_sql_database_instance.postgresql_instance.name
}

output "postgres_instance_connection_name" {
  description = "PSQL instance connection name"
  value       = google_sql_database_instance.postgresql_instance.connection_name
}

output "postgres_instance_ip_settings" {
  description = "PSQL instance IP address settings"
  value       = google_sql_database_instance.postgresql_instance.ip_address
}