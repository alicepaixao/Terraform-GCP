resource "google_sql_database_instance" "instance" {
  name             = "${var.instance_name}"
  database_version = "${var.database_version}"
  region           = "${var.region}"

  settings {
    tier              = "${var.db_tier}"
    availability_type = "${var.db_availability_type}"
    disk_size         = "${var.db_disk_size}"

    backup_configuration {
      enabled    = "${var.db_backup_enabled}"
      start_time = "${var.db_backup_start_time}"
    }

    database_flags = ["${var.database_flags}"]

    ip_configuration {
      ipv4_enabled = "false"
      private_network = "${var.network}"
    }
  }
}

resource "google_sql_database" "databases" {
  count      = "${length(var.databases)}"
  project    = "${var.project_id}"
  name       = "${element(var.databases, count.index)}"
  charset    = "${var.db_charset}"
  collation  = "${var.db_collation}"
  instance   = "${google_sql_database_instance.instance.name}"
  depends_on = ["google_sql_database_instance.instance"]
}

resource "google_sql_user" "users" {
  name     = "${var.db_root_username}"
  instance = "${google_sql_database_instance.instance.name}"
  password = "${var.db_root_password}"
}