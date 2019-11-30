variable "project_name" {
  type        = "string"
  description = "The project name"
}

variable "region" {
  type = "string"
}

variable "network" {
  description = "Network"
}

variable "subnetwork" {
  description = "Subnetwork"
}

variable "environment" {
  type        = "string"
  description = "The environment name"
}

variable "master_ipv4_cidr_block" {
  type        = "string"
  description = "IPv4 CIDR Block for Master Nodes"
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

variable "subnet_ip_cidr_range" {
  type        = "string"
  description = "Subnet CIDR block"
}

variable "services_ipv4_cidr_block" {
  type        = "string"
  description = "IPv4 CIDR Block for Kubernetes services"
}