#Binnen deze file wordt er een module aangeroepen die ervoor zorgt dat Tofu weet waar mijn Templates staan binnen deze omgeving

module "ubuntu_server" {
  source = "../../../Templates/Linux/Ubuntu_Server"

  ubuntu_server_vm = {
    name        = "Ubuntu-Server-vm"
    target_node = var.proxmox_node

    template = var.ubuntu_template_name
    bridge   = var.default_vm_bridge
    storage  = var.default_vm_storage
    disk_gb  = 20

    cores   = 2
    sockets = 1
    memory  = 2048
  }
}

