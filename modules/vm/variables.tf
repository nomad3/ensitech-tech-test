variable "vm_name" {
  type = string
  description = "The name of the virtual machine."
}

variable "vm_machine_type" {
  type = string
  description = "The machine type of the virtual machine."
  default = "f1-micro"
}

variable "vm_zone" {
  type = string
  description = "The zone in which to create the virtual machine."
}

variable "network_name" {
  type = string
  description = "The name of the network to attach the virtual machine to."
}

variable "subnetwork_name" {
  type = string
  description = "The name of the subnetwork to attach the virtual machine to."
}

variable "gcp_project_id" {
  type = string
  description = "The ID of the GCP project."
}
