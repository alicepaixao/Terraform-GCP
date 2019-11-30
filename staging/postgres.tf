# Content Postgres DB instance

resource "random_string" "content_password" {
  length  = 16
  special = true
}

resource "random_string" "company_password" {
  length  = 16
  special = true
}

resource "random_id" "content_postgres_name_suffix" {
  byte_length = 6
}

resource "random_id" "company_postgres_name_suffix" {
  byte_length = 5
}


module "google_postgres_content" {
  source               = "../modules/postgres"
  region               = "${var.region}"
  network              = "${google_compute_network.project_network.self_link}"
  project_id           = "${var.project_id}"
  instance_name        = "${var.content_database_instance_name}-${random_id.content_postgres_name_suffix.hex}"
  databases            = "${var.content_databases}"
  database_version     = "${var.content_database_version}"
  db_charset           = "${var.content_db_charset}"
  db_collation         = "${var.content_db_collation}"
  db_tier              = "${var.content_db_tier}"
  db_root_username     = "${var.content_db_root_username}"
  db_root_password     = "${random_string.content_password.result}"
  db_availability_type = "${var.content_db_availability_type}"
  db_disk_size         = "${var.content_db_disk_size}"
  db_backup_enabled    = "${var.content_db_backup_enabled}"
  authorized_networks  = "${var.authorized_networks}"
  db_backup_start_time = "${var.content_db_backup_start_time}"
  database_flags       = ["${var.content_db_flags}"]

  depends_on = [
    # Adding the depends on variable in postgres module as dummy variable to establish vpc peering connection
    # More details can be found on below link
    #https://github.com/hashicorp/terraform/issues/10462#issuecomment-285733504
    "${google_service_networking_connection.postgres_private_vpc_connection.self_link}",
  ]
}

module "google_postgres_company" {
  source               = "../modules/postgres"
  region               = "${var.region}"
  network              = "${google_compute_network.project_network.self_link}"
  project_id           = "${var.project_id}"
  instance_name        = "${var.company_database_instance_name}-${random_id.company_postgres_name_suffix.hex}"
  databases            = "${var.company_databases}"
  database_version     = "${var.company_database_version}"
  db_charset           = "${var.company_db_charset}"
  db_collation         = "${var.company_db_collation}"
  db_tier              = "${var.company_db_tier}"
  db_root_username     = "${var.company_db_root_username}"
  db_root_password     = "${random_string.company_password.result}"
  db_availability_type = "${var.company_db_availability_type}"
  db_disk_size         = "${var.company_db_disk_size}"
  db_backup_enabled    = "${var.company_db_backup_enabled}"
  authorized_networks  = "${var.authorized_networks}"
  db_backup_start_time = "${var.company_db_backup_start_time}"
  database_flags       = ["${var.company_db_flags}"]

  depends_on = [
    # Adding the depends on variable in postgres module as dummy variable to establish vpc peering connection
    # More details can be found on below link
    #https://github.com/hashicorp/terraform/issues/10462#issuecomment-285733504
    "${google_service_networking_connection.postgres_private_vpc_connection.self_link}",
  ]
}

resource "google_dns_record_set" "content_postgres_a_record" {
  # Creating 'A' record for the dns zone
  name         = "content-postgres.${google_dns_managed_zone.private-dns-managed-zone.dns_name}"
  managed_zone = "${google_dns_managed_zone.private-dns-managed-zone.name}"
  type         = "A"
  ttl          = 300
  rrdatas      = ["${module.google_postgres_content.ip}"]
}

resource "google_dns_record_set" "company_postgres_a_record" {
  # Creating 'A' record for the dns zone
  name         = "company-postgres.${google_dns_managed_zone.private-dns-managed-zone.dns_name}"
  managed_zone = "${google_dns_managed_zone.private-dns-managed-zone.name}"
  type         = "A"
  ttl          = 300
  rrdatas      = ["${module.google_postgres_company.ip}"]
}

# Product Type Secret
resource "kubernetes_secret" "product-types_postgres_kubernetes_secret" {
  metadata {
    name      = "${var.content_postgres_k8_secret_name}"
    namespace = "${var.content_postgres_k8_secret_namespace}"
  }

  data {
    DB_HOST     = "${google_dns_record_set.content_postgres_a_record.name}"
    DB_NAME     = "${var.content_databases[0]}"
    DB_PORT     = "5432"
    DB_USER     = "${var.content_db_root_username}"
    DB_PASSWORD = "${random_string.content_password.result}"
  }

  depends_on = ["module.gke"]
}

# Category Secret
resource "kubernetes_secret" "categories_postgres_kubernetes_secret" {
  metadata {
    name      = "${var.categories_postgres_k8_secret_name}"
    namespace = "${var.categories_postgres_k8_secret_namespace}"
  }

  data {
    DB_HOST     = "${google_dns_record_set.content_postgres_a_record.name}"
    DB_NAME     = "${var.content_databases[1]}"
    DB_PORT     = "5432"
    DB_USER     = "${var.content_db_root_username}"
    DB_PASSWORD = "${random_string.content_password.result}"
  }

  depends_on = ["module.gke"]
}

# Company Secret
resource "kubernetes_secret" "companies_postgres_kubernetes_secret" {
  metadata {
    name      = "${var.companies_postgres_k8_secret_name}"
    namespace = "${var.companies_postgres_k8_secret_namespace}"
  }

  data {
    DB_HOST     = "${google_dns_record_set.company_postgres_a_record.name}"
    DB_NAME     = "${var.company_databases[0]}"
    DB_PORT     = "5432"
    DB_USER     = "${var.company_db_root_username}"
    DB_PASSWORD = "${random_string.company_password.result}"
  }

  depends_on = ["module.gke"]
}


# Channel Secret
resource "kubernetes_secret" "channels_postgres_kubernetes_secret" {
  metadata {
    name      = "${var.channels_postgres_k8_secret_name}"
    namespace = "${var.channels_postgres_k8_secret_namespace}"
  }

  data {
    DB_HOST     = "${google_dns_record_set.company_postgres_a_record.name}"
    DB_NAME     = "${var.company_databases[1]}"
    DB_PORT     = "5432"
    DB_USER     = "${var.company_db_root_username}"
    DB_PASSWORD = "${random_string.company_password.result}"
  }

  depends_on = ["module.gke"]
}

# Product Secret
resource "kubernetes_secret" "products_postgres_kubernetes_secret" {
  metadata {
    name      = "${var.products_postgres_k8_secret_name}"
    namespace = "${var.products_postgres_k8_secret_namespace}"
  }

  data {
    DB_HOST     = "${google_dns_record_set.content_postgres_a_record.name}"
    DB_NAME     = "${var.content_databases[2]}"
    DB_PORT     = "5432"
    DB_USER     = "${var.content_db_root_username}"
    DB_PASSWORD = "${random_string.content_password.result}"
  }

  depends_on = ["module.gke"]
}