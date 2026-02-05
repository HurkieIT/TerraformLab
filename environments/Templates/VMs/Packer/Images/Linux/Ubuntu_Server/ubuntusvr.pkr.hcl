packer {
  required_plugins {
    proxmox = {
      source  = "github.com/hashicorp/proxmox"
      version = ">= 1.1.0"
    }
  }
}

# Proxmox + ISO + template vars (komen uit secrets file)
variable "proxmox_url" { type = string }
variable "proxmox_node" { type = string }
variable "proxmox_iso_storage" { type = string }
variable "proxmox_vm_storage" { type = string }
variable "ubuntu_iso" { type = string }
variable "bridge" { type = string }

# Output template name
variable "template_name" { type = string }

# SSH (voor build)
variable "ssh_username" { type = string }
variable "ssh_password" { type = string }

source "proxmox-iso" "ubuntu" {
  proxmox_url              = var.proxmox_url
  node                     = var.proxmox_node
  insecure_skip_tls_verify = true

  vm_name = var.template_name

  iso_storage_pool = var.proxmox_iso_storage
  iso_file         = var.ubuntu_iso

  scsi_controller = "virtio-scsi-single"

  disks {
    disk_size    = "20G"
    storage_pool = var.proxmox_vm_storage
    type         = "scsi"
    format       = "raw"
    iothread     = true
  }

  network_adapters {
    bridge = var.bridge
    model  = "virtio"
  }

  http_directory = "http"

  boot_command = [
    "<esc><wait>",
    "auto ",
    "ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
    "<enter><wait>"
  ]

  communicator = "ssh"
  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  ssh_timeout  = "30m"
}

build {
  sources = ["source.proxmox-iso.ubuntu"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get -y install qemu-guest-agent",
      "sudo systemctl enable --now qemu-guest-agent",
      "sudo cloud-init clean --logs || true"
    ]
  }
}
