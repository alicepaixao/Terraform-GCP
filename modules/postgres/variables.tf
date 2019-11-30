variable "project_id" {
  description = "The project ID to manage the Cloudsql resources"
}

variable "instance_name" {
  description = "name of the database Instance"
}

variable "region" {
  description = "Required region to host the instance"
}

variable "network" {
  description = "VPC network that the instance should be connected to"
}

variable "db_root_username" {
  type        = "string"
  description = "Root username for the database instance"
}

variable "db_root_password" {
  type        = "string"
  description = "Root password for the database instance"
}

variable "db_tier" {
  description = "Second-generation instance tiers are based on the machine"
  type        = "string"
}

variable "db_availability_type" {
  description = "Specifies whether the DB instance should be set up for high availability (REGIONAL) or single zone (ZONAL)"
  type        = "string"
}

variable "db_disk_size" {
  description = "The size of DB data disk, in GB"
  type        = "string"
}

variable "db_backup_enabled" {
  description = "True if backup configuration is enabled"
  type        = "string"
}

variable "db_backup_start_time" {
  description = "HH:MM format time indicating when the backup configuration starts"
  type        = "string"
}

variable "database_flags" {
  description = "The database flags for the master instance. See [more details](https://cloud.google.com/sql/docs/postgres/flags). Recommend referring the link before adding values since they are case sensitive"
  type        = "list"
}

variable "database_version" {
  type = "string"
}

variable "databases" {
  type = "list"
}

variable "db_charset" {
  type = "string"
}

variable "db_collation" {
  type = "string"
}

variable "depends_on" {
  # Adding the depends on variable in postgres module as dummy variable to establish vpc peering connection
  # More details can be found on below link
  #https://github.com/hashicorp/terraform/issues/10462#issuecomment-285733504
  type = "list"

  default = []
}