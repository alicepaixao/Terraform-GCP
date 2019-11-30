output "connection_name" {
  value = "${google_sql_database_instance.instance.connection_name}"
}

output "ip" {
  value = "${google_sql_database_instance.instance.private_ip_address}"
}

output "service_account_email_address" {
  value = "${google_sql_database_instance.instance.service_account_email_address}"
}
