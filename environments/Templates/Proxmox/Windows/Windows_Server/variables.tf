# Binnen deze file worden variables gedefineerd, zoals environments en regions waarin verschillende types of descriptions aan toegevoegd worden.

variable "windows_server_vm"{
  description = "Name of the Windows Virtual machine"
  type        = string
}

variable "windows_server_version" {
  description = "Version of Windows to use"
  type        = string
  default     = "Server 2022"
}

variable "edition" {
  description = "Edition of Windows to use"
  type        = string
  default     = "Standard"
}

variable "cpu" {
  description = "Number of CPU cores for the Windows VM"
  type        = number
  default     = 4
}

variable "memory" {
  description = "Amount of RAM in MB for the Windows VM"
  type        = number
  default     = 8196
}

variable "disk_size" {
  description = "Size of the disk in GB for the Windows VM"
  type        = number
  default     = 500
}


#variable "region" {
#  description = "Optional region (future use)"
#  type        = string
#  default     = null
#}