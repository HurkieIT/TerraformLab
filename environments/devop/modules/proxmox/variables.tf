# Binnen deze file worden variables gedefineerd, zoals environments en regions waarin verschillende types of descriptions aan toegevoegd worden.

variable "proxmox_host" {
  description = "Name of the Proxmox host"
  type        = string
}

variable "proxmox_port" {
  description = "Port for Proxmox API"
  type        = number
}

variable "proxmox_node" {
  description = "Proxmox node name"
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

variable "ubuntu_template_name" {
  type = string
}

variable "default_vm_bridge" {
  type = string
}

variable "default_vm_storage" {
  type = string
}