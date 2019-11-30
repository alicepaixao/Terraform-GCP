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


# Postgres
variable "authorized_networks" {
  description = "authorized networks to connect cloud sql instance"
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
  description = "K8 secret name to store products postgres credentials"
}

variable "products_postgres_k8_secret_namespace" {
    type        = "string"
  description = "K8 namespace to place the products postgres secret"
}

#Postgres Company Variables
variable "company_database_instance_name" {
  type        = "string"
  description = "company Postgres database instance name"
}

variable "company_database_version" {
  type = "string"
}

variable "company_databases" {
  type        = "list"
  description = "List of company databases to be created"
}

variable "company_db_charset" {
  type = "string"
}

variable "company_db_collation" {
  type = "string"
}

variable "company_db_tier" {
  type = "string"
}

variable "company_db_root_username" {
  type        = "string"
  description = "Root username for the company database instance"
}

variable "company_db_availability_type" {
  description = "Specifies whether the DB instance should be set up for high content (REGIONAL) or single zone (ZONAL)"
  type        = "string"
}

variable "company_db_flags" {
  description = "The database flags for the master instance. See [more details](https://cloud.google.com/sql/docs/postgres/flags). Recommend referring the link before adding values since they are case sensitive"
  type        = "list"
}

variable "company_db_disk_size" {
  description = "The size of DB data disk, in GB"
  type        = "string"
}

variable "company_db_backup_enabled" {
  description = "True if backup configuration is enabled"
  type        = "string"
}

variable "company_db_backup_start_time" {
  description = "HH:MM format time indicating when the backup configuration starts"
  type        = "string"
}

variable "companies_postgres_k8_secret_name" {
  type        = "string"
  description = "K8 secret name to store companies postgres credentials"
}

variable "companies_postgres_k8_secret_namespace" {
  type        = "string"
  description = "K8 namespace to place the companies postgres secret"
}

variable "channels_postgres_k8_secret_name" {
  type        = "string"
  description = "K8 secret name to store channels postgres credentials"
}

variable "channels_postgres_k8_secret_namespace" {
  type        = "string"
  description = "K8 namespace to place the channels postgres secret"
}

#topic
variable "topic_name" {
  type        = "string"
  description = "The name of the topic"
}

variable "serviceacount" {
  type        = "string"
  description = "The name of the Service Account"
}

# Variables for slack notification channel
variable "slack_notification_channels" {
  type        = "string"
  description = "list of notification channels"
}

variable "slack_auth_token" {
  type        = "string"
  description = "auth token for creating the slack channels"
}

variable "enable_notification" {
  type        = "string"
  description = "enabling slack notification"
}

variable "cpu_alert_policy_container_enabled" {
  type        = "string"
  description = " Variable to enable or disable the policy"
}

variable "cpu_usage_policy_duration_container" {
  type        = "string"
  description = "CPU Policy duration"
}

variable "cpu_usage_threshold_container" {
  type        = "string"
  description = "Threshold limit for the cpu usage"
}

variable "google_service_apis" {
  type        = "list"
  description = "Google service APIs to enable"
}

# Users who can view only stackdriver dashboard, project
variable "iam_monitor_viewer_users" {
  type        = "list"
  description = "Viewer permissions for read-only actions"
}

variable "stack_dashboard_create_users" {
  type        = "list"
  description = "Editor permissions for creating stackdriver dashboard"
}

# Variables for CPU usage alert policy creation

variable "node_cpu_usage_policy_name" {
  type        = "string"
  description = "alert policy name for CPU usage"
}

variable "cpu_alert_policy_enabled" {
  type        = "string"
  description = " Variable to enable or disable the policy"
}

variable "cpu_usage_policy_duration" {
  type        = "string"
  description = "CPU Policy duration"
}

variable "cpu_usage_threshold" {
  type        = "string"
  description = "Threshold limit for the cpu usage"
}

variable "cpu_usage_thresold_occurence" {
  type        = "string"
  description = "Threshold occurence of cpu usage"
}

variable "cpu_usage_alignment_period" {
  type        = "string"
  description = "Alignment Period for cpu usage"
}

# Variables for creating memory alert policy

variable "container_memory_policy_enabled" {
  type        = "string"
  description = "Enabling or disabling the policy as per requirement (True or False)"
}

variable "container_memory_policy_name" {
  type        = "string"
  description = "Alert policy name for memory utilization"
}

variable "container_memory_policy_duration" {
  type        = "string"
  description = "Duration for container memory policy alert"
}

variable "container_memory_threshold" {
  type        = "string"
  description = "Threshold memory utilization value"
}

variable "container_memory_thresold_occurence" {
  type        = "string"
  description = "Threshold occurence of memory policy "
}

variable "container_memory_alignment_period" {
  type        = "string"
  description = "Alignment period for container memory"
}

# Variables for VM Uptime check
variable "node_health_policy_name" {
  type        = "string"
  description = "Name to be given for node health policy"
}

variable "node_health_policy_enabled" {
  type        = "string"
  description = "Enable or Disable k8 node's uptime/health check policy"
}

variable "node_health_policy_duration" {
  type        = "string"
  description = "Duration required for k8 node uptime/health check"
}

variable "node_health_threshold_occurence" {
  type        = "string"
  description = "Count of threshold occurence of k8 node uptime/health"
}

variable "node_health_alignment_period" {
  type        = "string"
  description = "Alignment period  for k8 node uptime/health"
}

# Variables for CPU usage alert policy creation for containers

variable "cpu_usage_container_policy_name" {
  type        = "string"
  description = "alert policy name for CPU usage in k8 containers"
}

variable "cpu_usage_thresold_occurence_container" {
  type        = "string"
  description = "Threshold occurence of cpu usage"
}

variable "cpu_usage_alignment_period_container" {
  type        = "string"
  description = "Alignment Period for cpu usage"
}

variable "iam_monitoring_admin" {
  description = "variable for giving roles to SRE team"
  type        = "list"
}

variable "iam_viewer_users" {
  description = "Viewer permissions for read-only actions"
  type        = "list"

}

# variables for limit range
variable "memory_default_limit" {
  description = "Default memory value for the container"
  type        = "string"
}

variable "cpu_default_request" {
  description = "CPU default request for the container"
  type        = "string"
}

variable "memory_default_request" {
  description = "Memory default request for the container"
  type        = "string"
}

variable "cloudsql_cpu_usage_container_policy_name" {
  description = "cpu usage request for the cloudsql postgres"
  type        = "string"
}
variable "cloudsql_cpu_usage_policy_duration_container" {
  description = "CPU Policy duration for the cloudsql postgres"
  type        = "string"
}
variable "cloudsql_cpu_usage_threshold_container" {
  description = "Threshold value for the cloudsql postgres "
  type        = "string"
}
variable "cloudsql_cpu_usage_thresold_occurence_container"{
  description = "Threshold occurence for the cloudsql postgres"
  type        = "string"
}
variable  "cloudsql_cpu_usage_alignment_period_container"{
  description = "Alignment Period for cloudsql_cpu_usage"
  type        = "string"
}

# Cloudfare Certificates
variable  "ssl_server_certificate"{
  description = "Cloudfare SSL crt"
  type        = "string"
}

variable  "ssl_server_key"{
  description = "Cloudfare SSL key"
 type        = "string"
}

variable "sql_connections_policy_name" {
  type        = "string"
  description = "Name of cloudsql connections alert policy"
}

variable "sql_connections_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}

variable "sql_connections_policy_duration" {
  type        = "string"
  description = "cloudsql connections alert policy duration"
}

variable "sql_connections_threshold" {
  type        = "string"
  description = "Threshold limit for the cloudsql connections alert"
}

variable "sql_connections_thresold_occurence" {
  type        = "string"
  description = "Threshold occurence of cloudsql connections"
}

variable "sql_connections_alignment_period" {
  type        = "string"
  description = "Alignment Period for cloudsql connections"
}

# Variables for Pubsub Error Policy

variable "pubsub_error_policy_name" {
  type        = "string"
  description = "Name of Pubsub Error policy"
}

variable "pubsub_error_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}

variable "pubsub_error_policy_duration_0" {
  type        = "string"
  description = "Unacknowledged Pubsub Error policy duration for first condition"
}

variable "pubsub_error_policy_threshold_0" {
  type        = "string"
  description = "Threshold limit for the Pubsub Error policy for first condition"
}

variable "pubsub_error_policy_threshold_occurence_0" {
  type        = "string"
  description = "Threshold occurence of Pubsub Error policy for first condition"
}

variable "pubsub_error_policy_alignment_period_0" {
  type        = "string"
  description = "Alignment Period for Pubsub Error policy for first condition"
}

variable "pubsub_error_policy_duration_1" {
  type        = "string"
  description = "Unacknowledged Pubsub Error policy duration for second condition"
}

variable "pubsub_error_policy_threshold_1" {
  type        = "string"
  description = "Threshold limit for the Pubsub Error policy for second condition"
}

variable "pubsub_error_policy_threshold_occurence_1" {
  type        = "string"
  description = "Threshold occurence of Pubsub Error policy for second condition"
}

variable "pubsub_error_policy_alignment_period_1" {
  type        = "string"
  description = "Alignment Period for Pubsub Error policy for second condition"
}

variable "pubsub_error_policy_duration_2" {
  type        = "string"
  description = "Unacknowledged Pubsub Error policy duration for third condition"
}

variable "pubsub_error_policy_threshold_2" {
  type        = "string"
  description = "Threshold limit for the Pubsub Error policy for third condition"
}

variable "pubsub_error_policy_threshold_occurence_2" {
  type        = "string"
  description = "Threshold occurence of Pubsub Error policy for third condition"
}

variable "pubsub_error_policy_alignment_period_2" {
  type        = "string"
  description = "Alignment Period for Pubsub Error policy for third condition"
}

# Variables for no event to pubsub topic alert policy creation

variable "no_event_pubsub_policy_name" {
  type        = "string"
  description = "Name of no event to pubsub topic alert policy"
}

variable "no_event_pubsub_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}

variable "no_event_pubsub_policy_duration" {
  type        = "string"
  description = "No event to pubsub topic alert policy duration"
}

variable "no_event_pubsub_thresold_occurence" {
  type        = "string"
  description = "Threshold occurence of no event to pubsub topic alert"
}

variable "no_event_pubsub_alignment_period" {
  type        = "string"
  description = "Alignment Period for no event to pubsub topic alert policy policy"
}

variable "pubsub_unack_policy_name" {
  type        = "string"
  description = "Name of Unacknowledged PubSub message policy"
}

variable "pubsub_unack_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}

variable "pubsub_unack_policy_duration" {
  type        = "string"
  description = "Unacknowledged PubSub message policy duration"
}



variable "pubsub_unack_threshold" {
  type        = "string"
  description = "Threshold limit for the Unacknowledged PubSub messages"
}

variable "pubsub_unack_thresold_occurence" {
  type        = "string"
  description = "Threshold occurence of Unacknowledged PubSub messages"
}

variable "pubsub_unack_alignment_period" {
  type        = "string"
  description = "Alignment Period for Unacknowledged PubSub messages"
}

# Variables for Instana Agent
#variable "instana_agent_key" {
#  description = "Instana agent key"
#  type        = "string"
#}

#variable "instana_agent_endpoint_host" {
#  description = "Instana agent backend endpoint host"
#  type        = "string"
#}

#variable "instana_agent_endpoint_port" {
#  description = "Instana agent backend endpoint port"
#  type        = "string"
#}

#variable "instana_zone_name" {
#  description = "Zone that agent assigned to."
#  type        = "string"
#}

#variable "instana_cluster_name" {
#  description = "Cluster that agent assigned to."
#  type        = "string"
#}

#variable "install_instana" {
#  description = "Set this to true if instana has to be enabled,"
#  type        = "string"
#}

# Auth0 Secret

variable "auth0_secret_name" {
  type        = "string"
  description = "Set secret auth0 secret name"
}
variable "auth0_namespace" {
  type        = "string"
  description = "Set secret auth0 namespace"
}

variable "auth0_client_id" {
  type        = "string"
  description = "Set secret auth0 client id"
}
variable "auth0_client_secret" {
  type        = "string"
  description = "Set secret auth0 client secret"
}
variable "auth0_default_role" {
  type        = "string"
  description = "K8 secret name to store auth0 default role"
}
variable "auth0_default_password" {
  type        = "string"
  description = "K8 secret name to store auth0 default password"
}

# Variables for categories_4xx_error policy creation

variable "categories_4xx_error_alert_policy_alignment_period" {
  type        = "string"
  description = "Alignment Period for categories_4xx_error"
}

variable "categories_4xx_error_policy_name" {
  type        = "string"
  description = "Name of categories_4xx_error_policy_name"
}

variable "categories_4xx_error_alert_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}


variable "categories_4xx_error_alert_policy_duration" {
  type        = "string"
  description = "categories_4xx_error_alert_policy_duration"
}

variable "categories_4xx_error_alert_policy_threshold" {
  type        = "string"
  description = "Threshold limit for the categories_4xx alert"
}

variable "categories_4xx_error_alert_policy_thresold_occurence"{
  description = "Threshold occurence for the categories_4xx"
  type        = "string"
}

# Variables for no event to pubsub topic alert policy creation

variable "categories_500_error_alert_policy_alignment_period"{
  type        = "string"
  description = "Alignment Period for categories_500_error_alert_policy_alignment_period"
}

variable "categories_500_error_alert_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}

variable "categories_500_error_policy_name" {
  type        = "string"
  description = "Name of categories_500_error_policy_name"
}

variable "categories_500_error_alert_policy_duration" {
  type        = "string"
  description = "categories_500_error_alert_policy_duration"
}

variable "categories_500_error_alert_policy_threshold" {
  type        = "string"
  description = "Threshold limit for the categories_500_error alert"
}

variable "categories_500_error_alert_policy_thresold_occurence"{
  description = "Threshold occurence for the categories_500_error"
  type        = "string"
}

# Variables for categories-501-505_error alert policy creation

variable "categories-501-505_error_alert_policy_alignment_period"{
  type        = "string"
  description = "Alignment Period for categories-501-505_error_alert_policy_alignment_period"
}

variable "categories-501-505_error_alert_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}

variable "categories-501-505_error_policy_name" {
  type        = "string"
  description = "Name of categories-501-505_error_policy_name"
}

variable "categories-501-505_error_alert_policy_duration" {
  type        = "string"
  description = "categories-501-505_error_alert_policy_duration"
}

variable "categories-501-505_error_alert_policy_threshold" {
  type        = "string"
  description = "Threshold limit for the categories-501-505_error alert"
}

variable "categories-501-505_error_alert_policy_thresold_occurence"{
  description = "Threshold occurence for the categories-501-505_error alert"
  type        = "string"
}

# Variables for channels-400-409_error alert policy creation
variable "channels-400-409_error_alert_policy_alignment_period"{
  type        = "string"
  description = "Alignment Period for channels-400-409_error_alert_policy_alignment_period"
}

variable "channels-400-409_error_policy_name" {
  type        = "string"
  description = "Name of channels-400-409_error_policy_name"
}

variable "channels-400-409_error_alert_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}

variable "channels-400-409_error_alert_policy_duration" {
  type        = "string"
  description = "channels-400-409_error_alert_policy_duration"
}

variable "channels-400-409_error_alert_policy_threshold" {
  type        = "string"
  description = "Threshold limit for the channels-400-409_error alert"
}

variable "channels-400-409_error_alert_policy_thresold_occurence"{
  description = "Threshold occurence for the channels-400-409_error alert"
  type        = "string"
}

# Variables for channels_500_error alert policy creation
variable "channels_500_error_alert_policy_alignment_period"{
  type        = "string"
  description = "Alignment Period for channels_500_error_alert_policy_alignment_period"
}

variable "channels_500_error_policy_name" {
  type        = "string"
  description = "Name of channels_500_error_policy_name"
}

variable "channels_500_error_alert_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}

variable "channels_500_error_alert_policy_duration" {
  type        = "string"
  description = "channels_500_error_alert_policy_duration"
}

variable "channels_500_error_alert_policy_threshold" {
  type        = "string"
  description = "Threshold limit for the channels_500_error alert"
}

variable "channels_500_error_alert_policy_thresold_occurence"{
  description = "Threshold occurence for the channels_500_error_alert"
  type        = "string"
}

# Variables for channels-501-505_error alert policy creation
variable "channels-501-505_error_alert_policy_alignment_period"{
  type        = "string"
  description = "Alignment Period for channels-501-505_error_alert_policy_alignment_period"
}

variable "channels-501-505_error_policy_name" {
  type        = "string"
  description = "Name of channels-501-505_error_policy_name"
}

variable "channels-501-505_error_alert_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}

variable "channels-501-505_error_alert_policy_duration" {
  type        = "string"
  description = "channels-501-505_error_alert_policy_duration"
}

variable "channels-501-505_error_alert_policy_threshold" {
  type        = "string"
  description = "Threshold limit for the channels-501-505_error_alert alert"
}

variable "channels-501-505_error_alert_policy_thresold_occurence"{
  description = "Threshold occurence for the channels-501-505_error_alert"
  type        = "string"
}

# Variables for companies-400-409_error alert policy creation
variable "companies-400-409_error_alert_policy_alignment_period"{
  type        = "string"
  description = "Alignment Period for companies-400-409_error_alert_policy_alignment_period"
}

variable "companies-400-409_error_policy_name" {
  type        = "string"
  description = "Name of companies-400-409_error_policy_name"
}

variable "companies-400-409_error_alert_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}

variable "companies-400-409_error_alert_policy_duration" {
  type        = "string"
  description = "companies-400-409_error_alert_policy_duration"
}

variable "companies-400-409_error_alert_policy_threshold" {
  type        = "string"
  description = "Threshold limit for the companies-400-409_error alert"
}

variable "companies-400-409_error_alert_policy_thresold_occurence"{
  description = "Threshold occurence for the companies-400-409_error alert"
  type        = "string"
}

# Variables for companies-500_error alert policy creation
variable "companies-500_error_alert_policy_alignment_period"{
  type        = "string"
  description = "Alignment Period for companies-500_error_alert_policy_alignment_period"
}

variable "companies-500_error_policy_name" {
  type        = "string"
  description = "Name of companies-500_error_policy_name"
}

variable "companies-500_error_alert_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}

variable "companies-500_error_alert_policy_duration" {
  type        = "string"
  description = "companies-500_error_alert_policy_duration"
}

variable "companies-500_error_alert_policy_threshold" {
  type        = "string"
  description = "Threshold limit for the companies-500_error alert"
}

variable "companies-500_error_alert_policy_thresold_occurence"{
  description = "Threshold occurence for the companies-500_error alert"
  type        = "string"
}

# Variables for companies-501-505_error alert policy creation
variable "companies-501-505_error_alert_policy_alignment_period"{
  type        = "string"
  description = "Alignment Period for companies-501-505_error_alert_policy_alignment_period"
}

variable "companies-501-505_error_policy_name" {
  type        = "string"
  description = "Name of companies-501-505_error_policy_name"
}

variable "companies-501-505_error_alert_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}

variable "companies-501-505_error_alert_policy_duration" {
  type        = "string"
  description = "companies-501-505_error_alert_policy_duration"
}

variable "companies-501-505_error_alert_policy_threshold" {
  type        = "string"
  description = "Threshold limit for the companies-501-505_error alert"
}

variable "companies-501-505_error_alert_policy_thresold_occurence"{
  description = "Threshold occurence for the companies-501-505_error alert"
  type        = "string"
}

# Variables for Product-types-4xx-error alert policy creation
variable "Product-types-4xx-error_alert_policy_alignment_period"{
  type        = "string"
  description = "Alignment Period for Product-types-4xx-error_alert_policy_alignment_period"
}

variable "Product-types-4xx-error_policy_name" {
  type        = "string"
  description = "Name of Product-types-4xx-error_policy_name"
}

variable "Product-types-4xx-error_alert_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}

variable "Product-types-4xx-error_alert_policy_duration" {
  type        = "string"
  description = "Product-types-4xx-error_alert_policy_duration"
}

variable "Product-types-4xx-error_alert_policy_threshold" {
  type        = "string"
  description = "Threshold limit for the Product-types-4xx-error alert"
}

variable "Product-types-4xx-error_alert_policy_thresold_occurence"{
  description = "Threshold occurence for the Product-types-4xx-error alert"
  type        = "string"
}

# Variables for Product-types-500-error alert policy creation
variable "Product-types-500-error_alert_policy_alignment_period"{
  type        = "string"
  description = "Alignment Period for Product-types-500-error_alert_policy_alignment_period"
}

variable "Product-types-500-error_policy_name" {
  type        = "string"
  description = "Name of Product-types-500-error_policy_name"
}

variable "Product-types-500-error_alert_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}

variable "Product-types-500-error_alert_policy_duration" {
  type        = "string"
  description = "Product-types-500-error_alert_policy_duration"
}

variable "Product-types-500-error_alert_policy_threshold" {
  type        = "string"
  description = "Threshold limit for the Product-types-500-error_alert alert"
}

variable "Product-types-500-error_alert_policy_thresold_occurence"{
  description = "Threshold occurence for the Product-types-500-error alert"
  type        = "string"
}

# Variables for Product-types-501-505_error alert policy creation
variable "Product-types-501-505_error_alert_policy_alignment_period"{
  type        = "string"
  description = "Alignment Period for Product-types-501-505_error_alert_policy_alignment_period"
}

variable "Product-types-501-505_error_policy_name" {
  type        = "string"
  description = "Name of Product-types-501-505_error_policy_name"
}

variable "Product-types-501-505_error_alert_policy_enabled" {
  type        = "string"
  description = "Variable to enable or disable the policy"
}

variable "Product-types-501-505_error_alert_policy_duration" {
  type        = "string"
  description = "Product-types-501-505_error_alert_policy_duration"
}

variable "Product-types-501-505_error_alert_policy_threshold" {
  type        = "string"
  description = "Threshold limit for the Product-types-501-505_error alert"
}

variable "Product-types-501-505_error_alert_policy_thresold_occurence"{
  description = "Threshold occurence for the Product-types-501-505_error alert"
  type        = "string"
}

