# Binnen deze file worden variables gedefineerd, zoals environments en regions waarin verschillende types of descriptions aan toegevoegd worden.

variable "windows_server_vm" {
  description = "Windows Server VM settings (clone-based)"
  type = object({
    name        = string
    target_node = string

    template = string
    bridge  = string
    storage = string
    disk_gb = number

    cores   = number
    sockets = number
    memory  = number
  })
}
variable "windows_server_version" {
  description = "Version of the Windows Server"
  type        = string
  default     = "2022"
}


#variable "region" {
#  description = "Optional region (future use)"
#  type        = string
#  default     = null
#}