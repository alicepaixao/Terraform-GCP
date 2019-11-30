project_id = "second-atom-252020"

project_name = "curso-k8s"

environment = "test"

# GKE Cluster Variables
subnet_ip_cidr_range = "10.104.0.0/20" # Subnet IP Range

services_ipv4_cidr_block = "10.105.0.0/20" # IP address range of the services IPs in this cluster

master_ipv4_cidr_block = "10.106.0.0/28" # IP range to use for the hosted master network

region = "us-central1"

gke_version = "1.13.11-gke.14"

gke_namespaces = ["content", "offer", "company", "channel", "order", "rules", "users"]

gke_auto_min_count = 1

gke_auto_max_count = 5

gke_preemptible = false

gke_instance_type = "n1-standard-4"

initial_node_count = 1

node_pool_disk_size = 100

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

postgres_ipv4_address           = "10.105.16.0"
postgres_ipv4_prefix             = "20"


# Content Postgres Instance Variables
content_database_instance_name          = "k8s-sql"
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

# Content Product Types
content_postgres_k8_secret_name         = "content-service-db-secret"
content_postgres_k8_secret_namespace    = "content"

# Content Categories 
categories_postgres_k8_secret_name         = "categories-service-db-secret"
categories_postgres_k8_secret_namespace    = "content"

# Content Products
products_postgres_k8_secret_name           = "products-service-db-secret"
products_postgres_k8_secret_namespace      = "content"


# pubsub
product_type_create_topic = "product-type-created"
product_type_push_subscriptions = []
product_type_pull_subscriptions = [
    {
        name                 = "product-type-created-pull" // required
        ack_deadline_seconds = 20
    }
]

product_type_updated_topic = "product-type-updated"
product_type_updated_push_subscriptions = []
product_type_updated_pull_subscriptions = [
    {
        name                 = "product-type-updated-pull" // required
        ack_deadline_seconds = 20
    }
]

product_types_create_error_topic = "product-type-create-error"
product_types_create_error_push_subscription = []
product_types_create_error_pull_subscription = [
    {
        name = "product-type-create-error-pull" //required
        ack_deadline_seconds = 20
    }
]

channels_updated_topic = "channel-updated"
channels_updated_push_subscriptions = []
channels_updated_pull_subscriptions = [
    {
        name = "channel-updated-pull" //required
        ack_deadline_seconds = 20
    }
]

company_updated_topic = "company-updated"
company_updated_push_subscriptions = []
company_updated_pull_subscriptions = [
    {
        name = "company-updated-pull" //required
        ack_deadline_seconds = 20
    }
]

company_created_topic = "company-created"
company_created_push_subscriptions = []
company_created_pull_subscriptions = [
    {
        name = "company-created-pull" //required
        ack_deadline_seconds = 20
    }
]

company_deleted_topic = "company-deleted"
company_deleted_push_subscriptions = []
company_deleted_pull_subscriptions = [
    {
        name = "company-deleted-pull" //required
        ack_deadline_seconds = 20
    }
]

channel_created_topic = "channel-created"
channel_created_push_subscriptions = []
channel_created_pull_subscriptions = [
    {
        name = "channel-created-pull" //required
        ack_deadline_seconds = 20
    }
]

channel_deleted_topic = "channel-deleted"
channel_deleted_push_subscriptions = []
channel_deleted_pull_subscriptions = [
    {
        name = "channel-deleted-pull" //required
        ack_deadline_seconds = 20
    }
]