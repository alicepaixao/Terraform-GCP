# resource "google_compute_network" "project_network" {
#   name                    = "${var.project_name}-${var.environment}-network"
#   auto_create_subnetworks = "false"
# }

# resource "google_compute_subnetwork" "project_network" {
#   name                     = "${var.project_name}-${var.environment}-subnetwork"
#   ip_cidr_range            = "${var.subnet_ip_cidr_range}"
#   region                   = "${var.region}"
#   network                  = "${google_compute_network.project_network.self_link}"

#   private_ip_google_access = true
# }

# resource "google_compute_router" "router" {
#   name    = "${var.project_name}-router"
#   region  = "${google_compute_subnetwork.project_network.region}"
#   network = "${google_compute_network.project_network.self_link}"
# }

# resource "google_compute_router_nat" "nat" {
#   name                               = "${var.project_name}-nat"
#   router                             = "${google_compute_router.router.name}"
#   region                             = "${var.region}"
#   nat_ip_allocate_option             = "AUTO_ONLY"
#   source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
# }


# resource "google_compute_global_address" "postgres_private_ip_address" {
#   provider      = "google-beta"
#   name          = "postgres-private-ip-range"
#   purpose       = "VPC_PEERING"
#   address_type  = "INTERNAL"
#   address       = "${var.postgres_ipv4_address}"
#   prefix_length = "${var.postgres_ipv4_prefix}"
#   network       = "${google_compute_network.project_network.self_link}"
# }

# resource "google_service_networking_connection" "postgres_private_vpc_connection" {
#   provider                = "google-beta"
#   network                 = "${google_compute_network.project_network.self_link}"
#   service                 = "servicenetworking.googleapis.com"
#   reserved_peering_ranges = ["${google_compute_global_address.postgres_private_ip_address.name}"]
# }
