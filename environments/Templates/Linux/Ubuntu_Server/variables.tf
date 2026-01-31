# Binnen deze file worden variables gedefineerd, zoals environments en regions waarin verschillende types of descriptions aan toegevoegd worden.

variable "ubuntu_server_vm" {
  description = "Ubuntu Server VM 24.04 LTS"
  type        = string
}

variable "ubuntu_server_version" {
  description = "Version of Ubuntu to use"
  type        = string
  default     = "24.04"
}

variable "cpu" {
  description = "Number of CPU cores for the Ubuntu VM"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Amount of RAM in MB for the Ubuntu VM"
  type        = number
  default     = 4096
}

variable "disk_size" {
  description = "Size of the disk in GB for the Windows VM"
  type        = number
  default     = 64
}


#variable "region" {
#  description = "Optional region (future use)"
#  type        = string
#  default     = null
#}
