# File to define outputs after terraform execution

output "postgres_default_password" {
  description = "PSQL password to default user"
  value       = module.gcp_postgres.postgres_default_password
  sensitive = true
}

output "postgres_instance_name" {
  description = "PSQL instance name"
  value       = module.gcp_postgres.postgres_instance_name
}

output "postgres_instance_connection_name" {
  description = "PSQL instance connection name"
  value       = module.gcp_postgres.postgres_instance_connection_name
}

output "postgres_instance_ip_settings" {
  description = "PSQL instance IP address settings"
  value       = module.gcp_postgres.postgres_instance_ip_settings
}