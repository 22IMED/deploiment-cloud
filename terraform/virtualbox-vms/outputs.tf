output "vm_names" {
  description = "Noms des VMs créées"
  value       = [for vm in virtualbox_vm.nodes : vm.name]
}
