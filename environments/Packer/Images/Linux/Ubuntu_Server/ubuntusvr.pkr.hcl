packer {
  required_plugins {
    proxmox = {
      source  = "github.com/hashicorp/proxmox"
      version = ">= 1.1.0"
    }
  }
}

# -------- Proxmox vars (uit secrets file) --------
variable "proxmox_url"         { type = string }
variable "proxmox_node"        { type = string }
variable "proxmox_iso_storage" { type = string }
variable "proxmox_vm_storage"  { type = string }
variable "bridge"              { type = string }

# -------- Image vars --------
variable "ubuntu_iso"     { type = string }
variable "template_name"  { type = string }

# -------- Build login (tijdelijk OK in test) --------
variable "ssh_username" { type = string }
variable "ssh_password" { type = string }

source "proxmox-iso" "ubuntu_server" {
  proxmox_url              = var.proxmox_url
  node                     = var.proxmox_node
  insecure_skip_tls_verify = true

  vm_name              = var.template_name
  template_description = "Ubuntu Server template built by Packer"

  # Hardware (server: light)
  cores    = 2
  sockets  = 1
  memory   = 2048
  cpu_type = "host"

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

  # ISO boot
  iso_storage_pool = var.proxmox_iso_storage
  iso_file         = var.ubuntu_iso

  # NoCloud autoinstall
  http_directory = "http"

  boot_command = [
    "<esc><wait>",
    "autoinstall ",
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
  sources = ["source.proxmox-iso.ubuntu_server"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get -y install qemu-guest-agent",
      "sudo systemctl enable --now qemu-guest-agent",
      "sudo cloud-init clean --logs || true"
    ]
  }
}
