# Variable file for PostgreSQL module

##### Misc #####
variable "environment" {
  description = "Project enviroment (production / development / ...)"
  type        = string
}

##### PostgreSQL Instance #####
### Resource configuration variables ###
variable "postgres_version" {
    description = "version of PostgreSQL"
    default = "POSTGRES_13"
}
variable "deletion_protection" {
    description = "If set to true Terraform will not be able to delete the instance"
    default = false
    type = bool
}

### Settings variables ###
#  Default
variable "instance_tier" {
    description = "Instance type"
    default = "db-custom-1-3840"
}
variable "availability_type" {
    description = "High availability (Regional) or single zone (ZONAL)"
    default = "ZONAL"
    type = string
}

variable "database_flags" {
  description = "Key:value flags to set on databases"
  default     = {}
  type        = map(string)
}

# Backup
variable "backup_start_time" {
  description = "Time when backup can start - 24-hour notation"
  default     = "03:00"
  type        = string
}
variable "point_in_time_recovery" {
    description = "Enable/Disable Write-Ahead Logging (WAL)"
    default = false
    type = bool
}
variable "backup_location" {
  description = "Region where the backup will be stored"
  default     = "eu"
  type        = string
}

# Maintenance
variable "maintenance_window_day" {
  description = "maintenance ay of week (1-7), starting on Monday"
  default     = "7"
  type        = string
}

variable "maintenance_window_hour" {
  description = "Hour of day (0-23), ignored if day not set"
  default     = "4"
  type        = string
}

variable "update_track" {
  description = "Receive updates earlier (canary) or later (stable)"
  default     = "canary"
  type        = string
}

# IP Configuration
variable "private_ip" {
  description = "If set to true, private IP address will get allocated and connect it to VPC network set in `var.network` in the project -- once enabled, this can't be turned off."
  default     = false
  type        = bool
}

variable "public_ip" {
  description = "If set to true, public IP address will get allocated"
  default     = true
  type        = bool
}

variable "network" {
  description = "GCE VPC used for possible private IP addresses"
  default     = "default"
  type        = string
}

variable "authorized_networks" {
  description = "Networks authorized to connect. Example: [{name: the_office, cidr: 1.2.3.4/31}]"
  default     = []
  type        = list(map(string))
}

##### PostgreSQL Database #####
variable "password_length" {
  description = "Password length of postgres users (google_sql_user)"
  default     = 8
  type        = number
}

variable "postgres_database_user" {
  description = "Name of default database user"
  default = "default"
  type = string
}
variable "postgres_database_name" {
  description = "Name of default database"
  default = "default"
  type = string
}