# Binnen deze file worden variables gedefineerd, zoals environments en regions waarin verschillende types of descriptions aan toegevoegd worden.

variable "windows_vm" {
  description = "Name of the Windows Virtual machine"
  type        = string
}

variable "windows_version" {
  description = "Version of Windows to use"
  type        = string
  default     = "11"
}

variable "windows_release" {
  description = "Edition of Windows to use"
  type        = string
  default     = "22H2"
}

variable "edition" {
  description = "Edition of Windows to use"
  type        = string
  default     = "Pro"
}

variable "cpu" {
  description = "Number of CPU cores for the Windows VM"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Amount of RAM in MB for the Windows VM"
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
