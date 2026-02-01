#Binnen deze devop omgeving worden op basis van de gemaakte configuraties testomgevingen gerealisaeerd.
#De functie hiervan is om alles dat in de uiteindelijke PO omgeving uitgerold wordt grondig getest te hebben.

#Hier worden alleen de templates aangeroepen die in deze omgeving uitgerold moeten worden.

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


