<!-- BEGIN_TF_DOCS -->
## Resources

| Name | Type |
|------|------|
| [google_project_service.enable_sqladmin_api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_sql_database.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.postgresql_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [random_password.postgres_default](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [google_compute_network.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authorized_networks"></a> [authorized\_networks](#input\_authorized\_networks) | Networks authorized to connect. Example: [{name: the\_office, cidr: 1.2.3.4/31}] | `list(map(string))` | `[]` | no |
| <a name="input_availability_type"></a> [availability\_type](#input\_availability\_type) | High availability (Regional) or single zone (ZONAL) | `string` | `"ZONAL"` | no |
| <a name="input_backup_location"></a> [backup\_location](#input\_backup\_location) | Region where the backup will be stored | `string` | `"eu"` | no |
| <a name="input_backup_start_time"></a> [backup\_start\_time](#input\_backup\_start\_time) | Time when backup can start - 24-hour notation | `string` | `"03:00"` | no |
| <a name="input_database_flags"></a> [database\_flags](#input\_database\_flags) | Key:value flags to set on databases | `map(string)` | `{}` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | If set to true Terraform will not be able to delete the instance | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Project enviroment (production / development / ...) | `string` | n/a | yes |
| <a name="input_instance_tier"></a> [instance\_tier](#input\_instance\_tier) | Instance type | `string` | `"db-custom-1-3840"` | no |
| <a name="input_maintenance_window_day"></a> [maintenance\_window\_day](#input\_maintenance\_window\_day) | maintenance ay of week (1-7), starting on Monday | `string` | `"7"` | no |
| <a name="input_maintenance_window_hour"></a> [maintenance\_window\_hour](#input\_maintenance\_window\_hour) | Hour of day (0-23), ignored if day not set | `string` | `"4"` | no |
| <a name="input_network"></a> [network](#input\_network) | GCE VPC used for possible private IP addresses | `string` | `"default"` | no |
| <a name="input_password_length"></a> [password\_length](#input\_password\_length) | Password length of postgres users (google\_sql\_user) | `number` | `8` | no |
| <a name="input_point_in_time_recovery"></a> [point\_in\_time\_recovery](#input\_point\_in\_time\_recovery) | Enable/Disable Write-Ahead Logging (WAL) | `bool` | `false` | no |
| <a name="input_postgres_database_name"></a> [postgres\_database\_name](#input\_postgres\_database\_name) | Name of default database | `string` | `"default"` | no |
| <a name="input_postgres_database_user"></a> [postgres\_database\_user](#input\_postgres\_database\_user) | Name of default database user | `string` | `"default"` | no |
| <a name="input_postgres_version"></a> [postgres\_version](#input\_postgres\_version) | version of PostgreSQL | `string` | `"POSTGRES_13"` | no |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | If set to true, private IP address will get allocated and connect it to VPC network set in `var.network` in the project -- once enabled, this can't be turned off. | `bool` | `false` | no |
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip) | If set to true, public IP address will get allocated | `bool` | `true` | no |
| <a name="input_update_track"></a> [update\_track](#input\_update\_track) | Receive updates earlier (canary) or later (stable) | `string` | `"canary"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_postgres_default_password"></a> [postgres\_default\_password](#output\_postgres\_default\_password) | PSQL password to default user |
| <a name="output_postgres_instance_connection_name"></a> [postgres\_instance\_connection\_name](#output\_postgres\_instance\_connection\_name) | PSQL instance connection name |
| <a name="output_postgres_instance_ip_settings"></a> [postgres\_instance\_ip\_settings](#output\_postgres\_instance\_ip\_settings) | PSQL instance IP address settings |
| <a name="output_postgres_instance_name"></a> [postgres\_instance\_name](#output\_postgres\_instance\_name) | PSQL instance name |
<!-- END_TF_DOCS -->