#resource is de file die je kiest, met de naam en de content die je erin wilt zetten.
#Deze template is voor een Ubuntu machine uit te rollen in de test/productie omgeving.

resource "local_file" "ubuntu_vm" {
  filename = "${var.ubuntu_vm}.txt"

  content = "This is an Ubuntu VM version ${var.ubuntu_version} with ${var.cpu} CPU cores, ${var.memory} MB RAM and ${var.disk_size} GB disk space. Created by Terraform in the local environment."
}

resource "proxmox_vm_qemu" "vm" {
  name        = var.ubuntu_vm.name
  target_node = var.ubuntu_vm.target_node

  clone  = var.ubuntu_vm.template
  memory = var.ubuntu_vm.memory

  cpu {
    cores   = var.ubuntu_vm.cores
    sockets = var.ubuntu_vm.sockets
  }

    disk {
      slot     = "scsi0"
      type     = "disk"
      storage  = var.ubuntu_vm.storage
      size     = "${var.ubuntu_vm.disk_gb}G"
      iothread = true
    }

  network {
    id     = 0
    model  = "virtio"
    bridge = var.ubuntu_vm.bridge
  }
}
