resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

output "vpc_network_name" {
  value = google_compute_network.vpc_network.name
}
