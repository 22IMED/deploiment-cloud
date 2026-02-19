variable "vm_name_prefix" {
  description = "Préfixe des noms de VM"
  type        = string
  default     = "iac-vm"
}

variable "box_image" {
  description = "Image utilisée par le provider VirtualBox"
  type        = string
  default     = "https://app.vagrantup.com/debian/boxes/bookworm64/versions/12.20240211.1/providers/virtualbox.box"
}

variable "vm_cpus" {
  description = "Nombre de vCPU par VM"
  type        = number
  default     = 2
}

variable "vm_memory_mb" {
  description = "RAM par VM en MB"
  type        = number
  default     = 2048
}

variable "host_interface" {
  description = "Interface host-only VirtualBox"
  type        = string
  default     = "vboxnet0"
}
