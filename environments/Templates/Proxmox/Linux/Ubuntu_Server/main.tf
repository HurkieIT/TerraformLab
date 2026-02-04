#resource is de file die je kiest, met de naam en de content die je erin wilt zetten.
#Deze template is voor een Ubuntu server machine uit te rollen in de test/productie omgeving.

resource "proxmox_vm_qemu" "vm" {
  name        = var.ubuntu_server_vm.name
  target_node = var.ubuntu_server_vm.target_node

  clone  = var.ubuntu_server_vm.template
  memory = var.ubuntu_server_vm.memory

  cpu {
    cores   = var.ubuntu_server_vm.cores
    sockets = var.ubuntu_server_vm.sockets
  }

    disk {
      slot     = "scsi0"
      type     = "disk"
      storage  = var.ubuntu_server_vm.storage
      size     = "${var.ubuntu_server_vm.disk_gb}G"
      iothread = true
    }

  network {
    id     = 0
    model  = "virtio"
    bridge = var.ubuntu_server_vm.bridge
  }
}

