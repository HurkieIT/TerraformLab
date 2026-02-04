variable "pfsense_vm" {
  description = "Name of the Pfsense Virtual machine"
  type        = string
}

variable "pfsense_version" {
  description = "Version of Pfsense to use"
  type        = string
  default     = "CE 2.8.0"
}

variable "cpu" {
  description = "Number of CPU cores for the Pfsense VM"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Amount of RAM in MB for the Pfsense VM"
  type        = number
  default     = 4096
}

variable "disk_size" {
  description = "Size of the disk in GB for the Pfsense VM"
  type        = number
  default     = 64
} 

#Voor Firewalls zijn meestal meerdere netwerk adapters nodig, dus hier een lijst van objecten gebruikt.
#Elk object in de lijst bevat het type en de rol van de netwerk adapter.
#Doormiddel van het gebruik van deze rollen is het in de toekomst eenvoudiger om de juiste netwerken toe te wijzen in de main.tf.

variable network_adapters {
  description = "Number of network adapters for the Pfsense VM"
  type        = list(object({
    adapter_type = string
    role = string
  })) 
  default     = [
    { adapter_type = "e1000", role = "WAN" },
    { adapter_type = "e1000", role = "LAN1" },
    { adapter_type = "e1000", role = "OPT1" },
    { adapter_type = "e1000", role = "OPT2" }
  ]
}

#variable "region" {
#  description = "Optional region (future use)"
#  type        = string
#  default     = null
#}