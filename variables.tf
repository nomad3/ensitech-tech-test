variable "filename" {
  type = string
  description = "The name of the file to create."
  default = "example.txt"
}

variable "gcp_project_id" {
  type = string
  description = "The ID of the GCP project."
  default = "ensitech"
}

variable "gcp_region" {
  type = string
  description = "The GCP region to use."
  default = "us-central1"
}

variable "gcp_bucket_name" {
  type = string
  description = "The name of the GCP bucket to use for the Terraform backend."
  default = "ensitech"
}

variable "vm_name" {
  type = string
  description = "The name of the virtual machine."
  default = "terraform-vm"
}

variable "vm_zone" {
  type = string
  description = "The zone in which to create the virtual machine."
  default = "us-central1-a"
}

variable "vm_machine_type" {
  type = string
  description = "The machine type of the virtual machine."
  default = "f1-micro"
}
