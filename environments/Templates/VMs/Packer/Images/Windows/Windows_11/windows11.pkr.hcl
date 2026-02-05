packer {
  required_plugins {
    proxmox = {
      source  = "github.com/hashicorp/proxmox"
      version = ">= 1.1.0"
    }
  }
}

variable "proxmox_url" {
  type        = string
  description = "Proxmox API URL, e.g. https://pve:8006/api2/json"
}

variable "proxmox_node" {
  type        = string
  description = "Proxmox node name, e.g. pve1"
}

variable "proxmox_iso_storage" {
  type        = string
  description = "Storage where ISO is located, e.g. local"
}

variable "ubuntu_iso" {
  type        = string
  description = "Ubuntu ISO filename in ISO storage, e.g. ubuntu-24.04.1-live-server-amd64.iso"
}

variable "proxmox_vm_storage" {
  type        = string
  description = "Storage for VM disks, e.g. local-lvm"
}

variable "bridge" {
  type        = string
  description = "Bridge name, e.g. vmbr0"
  default     = "vmbr0"
}

variable "template_name" {
  type        = string
  default     = "ubuntu-24.04-template-v1.0"
}

variable "ssh_username" {
  type        = string
  default     = "packer"
}

variable "ssh_password" {
  type        = string
  default     = "packer"
}

source "proxmox-iso" "ubuntu" {
  proxmox_url              = var.proxmox_url
  node                     = var.proxmox_node

  # Auth: gebruik env vars (zie run commands hieronder)
  insecure_skip_tls_verify = true

  vm_name   = var.template_name
  template_description = "Built by Packer (Ubuntu 24.04) - base template"

  cores   = 2
  memory  = 2048
  sockets = 1
  cpu_type = "host"

  scsi_controller = "virtio-scsi-single"

  disks {
    disk_size         = "20G"
    storage_pool      = var.proxmox_vm_storage
    type              = "scsi"
    format            = "raw"
    iothread          = true
  }

  network_adapters {
    bridge = var.bridge
    model  = "virtio"
  }

  # ISO boot
  iso_storage_pool = var.proxmox_iso_storage
  iso_file         = var.ubuntu_iso

  # Cloud-init autoinstall via built-in HTTP server
  http_directory = "http"

  boot_command = [
    "<esc><wait>",
    "auto<wait>",
    " ",
    "ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
    "<enter><wait>"
  ]

  boot_wait = "5s"

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
