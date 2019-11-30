variable "master_ipv4_cidr_block" {
  type        = "string"
  description = "IPv4 CIDR Block for Master Nodes"
}

variable "services_ipv4_cidr_block" {
  type        = "string"
  description = "IPv4 CIDR Block for Kubernetes services"
}

variable "initial_node_count" {
  description = "The initial node count for the default node pool"
}
variable "daily_maintenance_window_start" {
  type        = "string"
  description = "Daily maintenance window start time"
}

variable "node_pool_disk_size" {
  description = "Disk Size for GKE Nodes"
}

variable "gke_preemptible" {
  description = "GKE Preemtible nodes"
}

variable "gke_auto_min_count" {
  description = "The minimum number of VMs in the pool"
}

variable "gke_auto_max_count" {
  description = "The maximum number of VMs in the pool"
}

variable "gke_version" {
  type        = "string"
  description = "The kubernetes version to use"
}

variable "gke_instance_type" {
  type        = "string"
  description = "The worker instance type"
}

variable "oauth_scopes" {
  description = "oauth scopes for gke cluster"
  type        = "list"
}

variable "gke_namespaces" {
  description = "Namespaces to be created after cluster creation"
  type        = "list"
}

variable "tiller_namespace" {
  type        = "string"
  description = "The Kubernetes namespace to use to deploy Tiller."
}

variable "tiller_service_account" {
  type        = "string"
  description = "The Kubernetes service account to add to Tiller."
}

variable "tiller_replicas" {
  description = "The amount of Tiller instances to run on the cluster."
}

variable "tiller_image" {
  type        = "string"
  description = "The image used to install Tiller."
}

variable "tiller_version" {
  type        = "string"
  description = "The Tiller image version to install."
}

variable "tiller_max_history" {
  description = "Limit the maximum number of revisions saved per release. Use 0 for no limit."
}

variable "tiller_net_host" {
  type        = "string"
  description = "Install Tiller with net=host."
}

variable "tiller_node_selector" {
  type        = "map"
  description = "Determine which nodes Tiller can land on."
}

variable "gke_encryption_state" {
  type        = "string"
  description = "gke cluster encryption state"
}

variable "gke_encryption_key" {
  type        = "string"
  description = "gke cluster encryption key"
}

variable "region" {
    type        = "string"
    description = "Region for creating the resource"
    default     = "us-central1"
}

variable "zone" {
    type        = "string"
    description = "Zone for creating the resource"
    default     = "us-central1-a"
}

variable "environment" {
    type        = "string"
    description = "Environment for tagging"
}

variable "project_name" {
    type        = "string"
    description = "Name of the project"
}

variable "subnet_ip_cidr_range" {
    description = "Subnet CIDR block"
}

variable "project_id" {
  type        = "string"
  description = "Project ID for creating the resources"
}

variable "deployment_service_account_roles" {
  description = "Role for deployment of application to GCP"
  type        = "list"
}


variable "postgres_ipv4_address" {
  type        = "string"
  description = "CIDR block for the  postgres database"
}

variable "postgres_ipv4_prefix" {
  type        = "string"
  description = "prefix block for the postgres database"
}

# Postgres Content Variables
variable "content_database_instance_name" {
  type        = "string"
  description = "content Postgres database instance name"
}

variable "content_database_version" {
  type = "string"
}

variable "content_databases" {
  type        = "list"
  description = "List of content databases to be created"
}

variable "content_db_charset" {
  type = "string"
}

variable "content_db_collation" {
  type = "string"
}

variable "content_db_tier" {
  type = "string"
}

variable "content_db_root_username" {
  type        = "string"
  description = "Root username for the content database instance"
}

variable "content_db_availability_type" {
  description = "Specifies whether the DB instance should be set up for high content (REGIONAL) or single zone (ZONAL)"
  type        = "string"
}

variable "content_db_flags" {
  description = "The database flags for the master instance. See [more details](https://cloud.google.com/sql/docs/postgres/flags). Recommend referring the link before adding values since they are case sensitive"
  type        = "list"
}

variable "content_db_disk_size" {
  description = "The size of DB data disk, in GB"
  type        = "string"
}

variable "content_db_backup_enabled" {
  description = "True if backup configuration is enabled"
  type        = "string"
}

variable "content_db_backup_start_time" {
  description = "HH:MM format time indicating when the backup configuration starts"
  type        = "string"
}

variable "content_postgres_k8_secret_name" {
  type        = "string"
  description = "K8 secret name to store content postgres credentials"
}

variable "content_postgres_k8_secret_namespace" {
  type        = "string"
  description = "K8 namespace to place the content postgres secret"
}

variable "categories_postgres_k8_secret_name" {
  type        = "string"
  description = "K8 secret name to store categories postgres credentials"
}

variable "categories_postgres_k8_secret_namespace" {
  type        = "string"
  description = "K8 namespace to place the categories postgres secret"
}

variable "products_postgres_k8_secret_name" {
    type        = "string"
  description = "K8s secret name to store products postgres credentials"
}

variable "products_postgres_k8_secret_namespace" {
    type        = "string"
  description = "K8s namespace to place the products postgres secret"
}

# Product Type Created Topic
variable "product_type_create_topic" {
  description = "The Pub/Sub topic name"
}

variable "product_type_push_subscriptions" {
  type        = "list"
  description = "The list of the push subscriptions with ack seconds"
}

variable "product_type_pull_subscriptions" {
  type        = "list"
  description = "The list of the pull subscriptions with ack seconds"
}

# Product Type Updated Topic
variable "product_type_updated_topic" {
  description = "The Pub/Sub topic name"
}

variable "product_type_updated_push_subscriptions" {
  type        = "list"
  description = "The list of the push subscriptions with ack seconds"
}

variable "product_type_updated_pull_subscriptions" {
  type        = "list"
  description = "The list of the pull subscriptions with ack seconds"
} 

# Product types created error topic
variable "product_types_create_error_topic" {
  description = "The Pub/Sub topic name"
}

variable "product_types_create_error_push_subscription" {
  type = "list"
  description = "The list of the push subscriptions with ack seconds"
}

variable "product_types_create_error_pull_subscription" {
  type = "list"
  description = "The list of the pull subscriptions with ack seconds"
}

# Channel Updated Topic
variable "channels_updated_topic" {
  description = "The Pub/Sub topic name"
}

variable "channels_updated_push_subscriptions" {
  type        = "list"
  description = "The list of the push subscriptions with ack seconds"
}

variable "channels_updated_pull_subscriptions" {
  type        = "list"
  description = "The list of the pull subscriptions with ack seconds"
}

# Company Updated Topic
variable "company_updated_topic" {
  description = "The Pub/Sub topic name"
}

variable "company_updated_push_subscriptions" {
  type        = "list"
  description = "The list of the push subscriptions with ack seconds"
}

variable "company_updated_pull_subscriptions" {
  type        = "list"
  description = "The list of the pull subscriptions with ack seconds"
}

# Company Created Topic
variable "company_created_topic" {
  description = "The Pub/Sub topic name"
}

variable "company_created_push_subscriptions" {
  type        = "list"
  description = "The list of the push subscriptions with ack seconds"
}

variable "company_created_pull_subscriptions" {
  type        = "list"
  description = "The list of the pull subscriptions with ack seconds"
}

# Company Deleted Topic

variable "company_deleted_topic" {
  description = "The Pub/Sub topic name"
}
variable "company_deleted_push_subscriptions" {
  type        = "list"
  description = "The list of the push subscriptions with ack seconds"
}

variable "company_deleted_pull_subscriptions" {
  type        = "list"
  description = "The list of the pull subscriptions with ack seconds"
}

# Channel Created Topic
variable "channel_created_topic" {
  description = "The Pub/Sub topic name"
}

variable "channel_created_push_subscriptions" {
  type        = "list"
  description = "The list of the push subscriptions with ack seconds"
}

variable "channel_created_pull_subscriptions" {
  type        = "list"
  description = "The list of the pull subscriptions with ack seconds"
}
# Channel Deleted Topic
variable "channel_deleted_topic" {
  description = "The Pub/Sub topic name"
}
variable "channel_deleted_push_subscriptions" {
  type        = "list"
  description = "The list of the push subscriptions with ack seconds"
}

variable "channel_deleted_pull_subscriptions" {
  type        = "list"
  description = "The list of the pull subscriptions with ack seconds"
}