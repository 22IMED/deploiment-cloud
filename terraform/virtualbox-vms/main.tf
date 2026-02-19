terraform {
  required_version = ">= 1.5.0"

  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "~> 0.2"
    }
  }
}

provider "virtualbox" {}

resource "virtualbox_vm" "nodes" {
  count  = 2
  name   = "${var.vm_name_prefix}-${count.index + 1}"
  image  = var.box_image
  cpus   = var.vm_cpus
  memory = var.vm_memory_mb

  network_adapter {
    type           = "hostonly"
    host_interface = var.host_interface
  }
}
