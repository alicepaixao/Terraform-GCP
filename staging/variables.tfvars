project_id = "cmp-core-staging"

project_name = "cmp-core"

environment = "staging"

# GKE Cluster Variables
subnet_ip_cidr_range = "10.105.0.0/20" # Subnet IP Range

services_ipv4_cidr_block = "10.107.0.0/20" # IP address range of the services IPs in this cluster

master_ipv4_cidr_block = "10.108.0.0/28" # IP range to use for the hosted master network

region = "us-central1"

gke_version = "1.13.6-gke.13"

gke_namespaces = ["content", "offer", "company", "channel", "order", "rules", "instana-agent", "users"]

gke_auto_min_count = 1

gke_auto_max_count = 5

gke_preemptible = false

gke_instance_type = "n1-standard-4"

initial_node_count = 1

node_pool_disk_size = 50

daily_maintenance_window_start = "03:00"

oauth_scopes = [
  "https://www.googleapis.com/auth/compute",
  "https://www.googleapis.com/auth/cloud-platform",
  "https://www.googleapis.com/auth/devstorage.read_only",
  "https://www.googleapis.com/auth/taskqueue",
  "https://www.googleapis.com/auth/sqlservice.admin",
  "https://www.googleapis.com/auth/monitoring.write",
  "https://www.googleapis.com/auth/servicecontrol",
  "https://www.googleapis.com/auth/service.management.readonly",
  "https://www.googleapis.com/auth/trace.append",
  "https://www.googleapis.com/auth/monitoring",
  "https://www.googleapis.com/auth/logging.write",
  "https://www.googleapis.com/auth/pubsub",
  "https://www.googleapis.com/auth/cloud_debugger",
]

tiller_replicas = 1

tiller_net_host = ""

tiller_version = "v2.14.2"

tiller_namespace = "kube-system"

tiller_image = "gcr.io/kubernetes-helm/tiller"

tiller_node_selector = {}

tiller_service_account = "tiller"

tiller_max_history = 0

gke_encryption_state = "DECRYPTED"

gke_encryption_key = ""

# Service Account Variables
deployment_service_account_roles = ["roles/container.admin"]

#Postgres Network Variables
authorized_networks = [
    {
        name                 = "Gitlab-Runner"
        value                = "35.196.187.189/32"
    },
    {
        name                 = "Falabella-Tecnologia"
        value                = "190.196.162.130/32"
    },
]
postgres_ipv4_address           = "10.107.16.0"
postgres_ipv4_prefix             = "20"

# Content Postgres Instance Variables
content_database_instance_name          = "content-postgresql"
content_database_version                = "POSTGRES_9_6"
content_databases                       = ["content-psql","categories-psql","products-psql"]
content_db_root_username                = "postgres-user"
content_db_charset                      = "UTF8"
content_db_collation                    = "en_US.UTF8"
content_db_tier                         = "db-custom-1-3840"
content_db_availability_type            = "ZONAL"
content_db_disk_size                    = "20"
content_db_backup_enabled               = "true"
content_db_backup_start_time            = "04:00"
content_db_flags                        = [
    {
        name  = "log_min_duration_statement",
        value = "1000"
    },
]

# Company Postgres Instance Variables
company_database_instance_name          = "company-postgresql"
company_database_version                = "POSTGRES_9_6"
company_databases                       = ["company-psql","channel-psql"]
company_db_root_username                = "postgres-user"
company_db_charset                      = "UTF8"
company_db_collation                    = "en_US.UTF8"
company_db_tier                         = "db-custom-1-3840"
company_db_availability_type            = "ZONAL"
company_db_disk_size                    = "20"
company_db_backup_enabled               = "true"
company_db_backup_start_time            = "04:00"
company_db_flags                        = [
    {
        name  = "log_min_duration_statement",
        value = "1000"
    },
]

# Product Types
content_postgres_k8_secret_name         = "content-service-db-secret"
content_postgres_k8_secret_namespace    = "content"

# Categories 
categories_postgres_k8_secret_name         = "categories-service-db-secret"
categories_postgres_k8_secret_namespace    = "content"

# Content Products
products_postgres_k8_secret_name           = "products-service-db-secret"
products_postgres_k8_secret_namespace      = "content"

# Companies
companies_postgres_k8_secret_name         = "companies-service-db-secret"
companies_postgres_k8_secret_namespace    = "company"

# Channels
channels_postgres_k8_secret_name          = "channels-service-db-secret"
channels_postgres_k8_secret_namespace     = "company"

#topic
topic_name=""
serviceacount=""

# Variables for slack notification channel creation
slack_notification_channels = "#cmp-monitoring"
enable_notification =  "true"

# Variables for CPU alert policy creation at container level
cpu_usage_container_policy_name = "k8s pod cpu limit utilization"
cpu_alert_policy_container_enabled = "true"
cpu_usage_policy_duration_container = "60s"
cpu_usage_threshold_container = "0.1"
cpu_usage_alignment_period_container = "60s"
cpu_usage_thresold_occurence_container = "1"

iam_monitor_viewer_users = [
    "user:bgorai@falabella.cl",
]

iam_viewer_users = [
    "user:ext_aksingh@falabella.cl",
]

iam_monitoring_admin = [
    "user:ext_rsaini@falabella.cl",
]

# Users who can create stackdriver dashboards in appropriate project
stack_dashboard_create_users = [
    "user:ext_mpandey@falabella.cl",
]

google_service_apis = [
    "logging.googleapis.com",
    "monitoring.googleapis.com",
]

# Variables for CPU alert policy creation
node_cpu_usage_policy_name = "Node-CPU-Utilization"
cpu_alert_policy_enabled = "true"
cpu_usage_policy_duration = "60s"
cpu_usage_threshold = "0.80"
cpu_usage_thresold_occurence = "1"
cpu_usage_alignment_period = "60s"

# Variables for Memory utilization policy
container_memory_policy_name = "Memory-Utilization-Container"
container_memory_policy_enabled = "true"
container_memory_policy_duration = "180s"
container_memory_threshold = "0.80"
container_memory_thresold_occurence = "2"
container_memory_alignment_period = "60s"

# Variables for VM uptime check
node_health_policy_name         = "k8-Node-Health-Check"
node_health_policy_enabled      = "true"
node_health_policy_duration     = "3600s"
node_health_threshold_occurence = "1"
node_health_alignment_period    = "300s"

# Variables for CPU alert policy creation at container level
cpu_usage_container_policy_name = "CPU-Utilization-Container"
cpu_alert_policy_container_enabled = "true"
cpu_usage_policy_duration_container = "180s"
cpu_usage_threshold_container = "0.80"
cpu_usage_thresold_occurence_container = "2"
cpu_usage_alignment_period_container = "60s"


# variables for limit range
memory_default_limit =  "900M"
cpu_default_request = "300m"
memory_default_request = "500M"

# Google api services list
google_service_apis = [
    "iam.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
]

# Variables for CPU alert policy creation at container level
cloudsql_cpu_usage_container_policy_name = "Cloudsql-Postgres-CPU-Utilization"
cloudsql_cpu_alert_policy_container_enabled = "true"
cloudsql_cpu_usage_policy_duration_container = "900s"
cloudsql_cpu_usage_threshold_container = "0.80"
cloudsql_cpu_usage_thresold_occurence_container = "2"
cloudsql_cpu_usage_alignment_period_container = "120s"

# Variables for sql connection alert policy
sql_connections_policy_name = "Cloud-SQL-DB-Connections"
sql_connections_policy_enabled = "true"
sql_connections_policy_duration = "180s"
sql_connections_threshold = "60"
sql_connections_thresold_occurence = "1"
sql_connections_alignment_period = "60s"

# Variables for pubsub error alert policy
pubsub_error_policy_name = "Pubsub-error"
pubsub_error_policy_enabled = "true"
pubsub_error_policy_duration_0 = "0s"
pubsub_error_policy_threshold_0 = "0"
pubsub_error_policy_threshold_occurence_0 = "1"
pubsub_error_policy_alignment_period_0 = "60s"
pubsub_error_policy_duration_1 = "0s"
pubsub_error_policy_threshold_1 = "0"
pubsub_error_policy_threshold_occurence_1 = "1"
pubsub_error_policy_alignment_period_1 = "60s"
pubsub_error_policy_duration_2 = "0s"
pubsub_error_policy_threshold_2 = "0"
pubsub_error_policy_threshold_occurence_2 = "1"
pubsub_error_policy_alignment_period_2 = "60s"


# Variables for pubsub unacknowledge message alert policy
pubsub_unack_policy_name = "Unacknowledged-PubSub-Messages"
pubsub_unack_policy_enabled = "true"
pubsub_unack_policy_duration = "180s"
pubsub_unack_threshold = "7200"
pubsub_unack_thresold_occurence = "1"
pubsub_unack_alignment_period = "60s"


# Variables for no event to pubsub topic alert policy
no_event_pubsub_policy_name = "No-Event-To-PubSub"
no_event_pubsub_policy_enabled = "true"
no_event_pubsub_policy_duration = "1800s"
no_event_pubsub_thresold_occurence = "1"
no_event_pubsub_alignment_period = "60s"


# Variable for Instana
#instana_agent_endpoint_host = "saas-us-west-2.instana.io "
#instana_agent_endpoint_port = "443"
#instana_cluster_name = "cmp-core-cluster"
#instana_zone_name = "us-central1"
#install_instana   = "true"

# Variables for Auth0
auth0_secret_name = "auth0-secret"
auth0_namespace = "users"

# Variables for categories_4xx_error alert policy creation
categories_4xx_error_policy_name = "categories_4xx_error"
categories_4xx_error_alert_policy_enabled = "true"
categories_4xx_error_alert_policy_duration = "60s"
categories_4xx_error_alert_policy_threshold = "0"
categories_4xx_error_alert_policy_thresold_occurence = "1"
categories_4xx_error_alert_policy_alignment_period = "60s"


# Variables for categories_500_error alert policy creation
categories_500_error_policy_name = "categories_500_error"
categories_500_error_alert_policy_enabled = "true"
categories_500_error_alert_policy_duration = "60s"
categories_500_error_alert_policy_thresold_occurence = "1"
categories_500_error_alert_policy_threshold = "0"
categories_500_error_alert_policy_alignment_period = "60s"

# Variables for categories-501-505_error alert policy creation
categories-501-505_error_policy_name = "categories-501-505_error"
categories-501-505_error_alert_policy_enabled = "true"
categories-501-505_error_alert_policy_duration = "60s"
categories-501-505_error_alert_policy_thresold_occurence = "1"
categories-501-505_error_alert_policy_threshold = "0"
categories-501-505_error_alert_policy_alignment_period = "60s"

# Variables for channels-400-409_error alert policy creation
channels-400-409_error_policy_name = "channels-400-409_error"
channels-400-409_error_alert_policy_enabled = "true"
channels-400-409_error_alert_policy_duration = "60s"
channels-400-409_error_alert_policy_thresold_occurence = "1"
channels-400-409_error_alert_policy_threshold = "0"
channels-400-409_error_alert_policy_alignment_period = "60s"

# Variables for channels_500_error alert policy creation
channels_500_error_policy_name = "channels_500_error"
channels_500_error_alert_policy_enabled = "true"
channels_500_error_alert_policy_duration = "60s"
channels_500_error_alert_policy_thresold_occurence = "1"
channels_500_error_alert_policy_threshold = "0"
channels_500_error_alert_policy_alignment_period = "60s"

# Variables for channels-501-505_error alert policy creation
channels-501-505_error_policy_name = "channels-501-505_error"
channels-501-505_error_alert_policy_enabled = "true"
channels-501-505_error_alert_policy_duration = "60s"
channels-501-505_error_alert_policy_thresold_occurence = "1"
channels-501-505_error_alert_policy_threshold = "0"
channels-501-505_error_alert_policy_alignment_period = "60s"

# Variables for companies-400-409_error alert policy creation
companies-400-409_error_policy_name = "companies-400-409_error"
companies-400-409_error_alert_policy_enabled = "true"
companies-400-409_error_alert_policy_duration = "60s"
companies-400-409_error_alert_policy_threshold = "0"
companies-400-409_error_alert_policy_thresold_occurence = "1"
companies-400-409_error_alert_policy_alignment_period = "60s"

# Variables for companies-500_error alert policy creation
companies-500_error_policy_name = "companies-500_error"
companies-500_error_alert_policy_enabled = "true"
companies-500_error_alert_policy_duration = "60s"
companies-500_error_alert_policy_threshold = "0"
companies-500_error_alert_policy_thresold_occurence = "1"
companies-500_error_alert_policy_alignment_period = "60s"

# Variables for companies-501-505_error alert policy creation
companies-501-505_error_policy_name = "companies-501-505_error"
companies-501-505_error_alert_policy_enabled = "true"
companies-501-505_error_alert_policy_duration = "60s"
companies-501-505_error_alert_policy_threshold = "0"
companies-501-505_error_alert_policy_thresold_occurence= "1"
companies-501-505_error_alert_policy_alignment_period = "60s"

# Variables for Product-types-4xx_error alert policy creation
Product-types-4xx-error_policy_name = "Product-types-4xx-error"
Product-types-4xx-error_alert_policy_enabled = "true"
Product-types-4xx-error_alert_policy_duration = "60s"
Product-types-4xx-error_alert_policy_threshold = "0"
Product-types-4xx-error_alert_policy_thresold_occurence = "1"
Product-types-4xx-error_alert_policy_alignment_period = "60s"

# Variables for Product-types-500_error alert policy creation
Product-types-500-error_policy_name = "Product-types-500-error"
Product-types-500-error_alert_policy_enabled = "true"
Product-types-500-error_alert_policy_duration = "60s"
Product-types-500-error_alert_policy_threshold = "0"
Product-types-500-error_alert_policy_thresold_occurence = "1"
Product-types-500-error_alert_policy_alignment_period = "60s"

# Variables for Product-types-501-505_error alert policy creation
Product-types-501-505_error_policy_name = "Product-types-501-505_error"
Product-types-501-505_error_alert_policy_enabled = "true"
Product-types-501-505_error_alert_policy_duration = "60s"
Product-types-501-505_error_alert_policy_threshold = "0"
Product-types-501-505_error_alert_policy_thresold_occurence = "1"
Product-types-501-505_error_alert_policy_alignment_period = "60s"