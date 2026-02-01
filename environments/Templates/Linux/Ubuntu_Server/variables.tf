# Binnen deze file worden variables gedefineerd, zoals environments en regions waarin verschillende types of descriptions aan toegevoegd worden.

variable "ubuntu_server_vm" {
  description = "Ubuntu Server VM settings (clone-based)"
  type = object({
    name        = string
    target_node = string

    template = string
    bridge   = string
    storage  = string
    disk_gb  = number

    cores   = number
    sockets = number
    memory  = number
  })
}

variable "ubuntu_server_version" {
  description = "Version of the Ubuntu Server"
  type        = string
  default     = "22.04"
}

#variable "region" {
#  description = "Optional region (future use)"
#  type        = string
#  default     = null
#}
