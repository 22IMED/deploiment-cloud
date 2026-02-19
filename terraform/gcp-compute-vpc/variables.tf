variable "project_id" {
  description = "ID du projet GCP"
  type        = string
}

variable "region" {
  description = "Région GCP"
  type        = string
  default     = "europe-west1"
}

variable "zone" {
  description = "Zone GCP"
  type        = string
  default     = "europe-west1-b"
}

variable "prefix" {
  description = "Préfixe de nommage des ressources"
  type        = string
  default     = "cloudguru"
}

variable "subnet_cidr" {
  description = "CIDR du subnet"
  type        = string
  default     = "10.10.0.0/24"
}

variable "allowed_source_ranges" {
  description = "Sources autorisées sur SSH/HTTP/HTTPS"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "machine_type" {
  description = "Type de machine Compute Engine"
  type        = string
  default     = "e2-medium"
}

variable "image" {
  description = "Image boot disk"
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "disk_size_gb" {
  description = "Taille du disque de boot en GB"
  type        = number
  default     = 20
}
