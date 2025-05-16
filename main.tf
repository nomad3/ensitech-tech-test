terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
  backend "gcs" {
    bucket = var.gcp_bucket_name
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

module "vpc_network" {
  source = "./modules/vpc"
  vpc_name = "terraform-network"
}

module "vm" {
  source = "./modules/vm"
  vm_name = var.vm_name
  vm_machine_type = var.vm_machine_type
  vm_zone = var.vm_zone
  network_name = module.vpc_network.vpc_network_name
  subnetwork_name = "default"
  gcp_project_id = var.gcp_project_id
}

resource "google_compute_subnetwork" "default" {
  name          = "default"
  ip_cidr_range = "10.0.0.0/16"
  network       = module.vpc_network.vpc_network_name
  region        = var.gcp_region
}

output "vpc_network_name" {
  value = module.vpc_network.vpc_network_name
}

output "vm_name" {
  value = module.vm.vm_name
}
