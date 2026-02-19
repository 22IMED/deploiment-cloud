terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "main" {
  name                    = "${var.prefix}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "main" {
  name          = "${var.prefix}-subnet"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.main.id
}

resource "google_compute_firewall" "ssh_http" {
  name    = "${var.prefix}-allow-ssh-http"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = var.allowed_source_ranges
  target_tags   = ["${var.prefix}-web"]
}

resource "google_compute_instance" "vm" {
  name         = "${var.prefix}-vm"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["${var.prefix}-web"]

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size_gb
      type  = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.main.id

    access_config {}
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}
