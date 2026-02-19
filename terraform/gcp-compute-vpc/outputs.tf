output "vm_name" {
  value       = google_compute_instance.vm.name
  description = "Nom de la VM GCP"
}

output "vm_public_ip" {
  value       = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
  description = "IP publique de la VM"
}

output "vpc_name" {
  value       = google_compute_network.main.name
  description = "Nom du VPC créé"
}
