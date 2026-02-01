# Binnen deze file worden variables gedefineerd, zoals environments en regions waarin verschillende types of descriptions aan toegevoegd worden.

variable "proxmox_host" {
  description = "Proxmox API hostname or IP"
  type        = string
}

variable "proxmox_port" {
  description = "Proxmox API port (usually 8006)"
  type        = number
  default     = 8006
}

variable "proxmox_node" {
  description = "Proxmox node name to deploy on"
  type        = string
}

variable "proxmox_token_id" {
  description = "API token ID for Proxmox authentication"
  type        = string
}

variable "proxmox_token_secret" {
  description = "API token secret for Proxmox authentication"
  type        = string
  sensitive   = true
}

# Defaults die je in elke module wil hergebruiken
variable "default_vm_bridge" {
  description = "Default Linux bridge for VMs (e.g. vmbr0)"
  type        = string
}

variable "default_vm_storage" {
  description = "Default Proxmox storage for VM disks (e.g. local-lvm)"
  type        = string
}

variable "ubuntu_template_name" {
  description = "Template name to clone for Ubuntu Server"
  type        = string
}
