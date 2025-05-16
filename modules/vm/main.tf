
resource "google_project_iam_member" "logging_agent" {
  project = var.gcp_project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_compute_instance_template.default.service_account.0.email}"
}

resource "google_compute_firewall" "default" {
  name    = "allow-http"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags = ["http-server"]
}

resource "google_compute_instance_template" "default" {
  name             = "instance-template"
  machine_type   = var.vm_machine_type
  network_performance_config {
    total_egress_bandwidth_tier = "DEFAULT"
  }
  disk {
    source_image = "debian-cloud/debian-11"
  }
  network_interface {
    subnetwork = var.subnetwork_name
  }
  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
  metadata = {
    "startup-script" = "apt-get update && apt-get install -y nginx google-cloud-logging-agent && echo 'Hello, world!' > /var/www/html/index.html"
    enable-oslogin = true
  }
  tags = ["http-server"]
}

resource "google_compute_autoscaler" "default" {
  name   = "autoscaler"
  zone   = var.vm_zone
  target = google_compute_instance_group_manager.default.id

  autoscaling_policy {
    min_replicas = 1
    max_replicas = 5
    cpu_utilization {
      target = 0.8
    }
  }
}

resource "google_compute_instance_group_manager" "default" {
  name               = "instance-group-manager"
  zone               = var.vm_zone
  version {
    instance_template  = google_compute_instance_template.default.id
    name               = "primary"
  }
  base_instance_name = "vm"
  target_size        = 1
}
