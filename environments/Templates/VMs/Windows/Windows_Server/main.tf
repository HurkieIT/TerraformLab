#resource is de file die je kiest, met de naam en de content die je erin wilt zetten.

resource "proxmox_vm_qemu" "vm" {
  name        = var.windows_server_vm.name
  target_node = var.windows_server_vm.target_node

  clone  = var.windows_server_vm.template
  memory = var.windows_server_vm.memory
  agent  = 1
  bios   = "ovmf"

  cpu {
    cores   = var.windows_server_vm.cores
    sockets = var.windows_server_vm.sockets
    type    = "host"
  }

  disk {
    slot     = "scsi0"
    type     = "disk"
    storage  = var.windows_server_vm.storage
    size     = "${var.windows_server_vm.disk_gb}G"
    iothread = true
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = var.windows_server_vm.bridge
  }
}



