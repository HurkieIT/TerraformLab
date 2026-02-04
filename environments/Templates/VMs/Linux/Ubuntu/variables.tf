# Binnen deze file worden variables gedefineerd, zoals environments en regions waarin verschillende types of descriptions aan toegevoegd worden.

variable "ubuntu_vm" {
  description = "Ubuntu VM settings (clone-based)"
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

variable "ubuntu_version" {
  description = "Version of the Ubuntu VM"
  type        = string
  default     = "24.04"
}

#variable "region" {
#  description = "Optional region (future use)"
#  type        = string
#  default     = null
#}
