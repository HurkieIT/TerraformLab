# Binnen deze file worden variables gedefineerd, zoals environments en regions waarin verschillende types of descriptions aan toegevoegd worden.

variable "opnsense_vm" {
  description = "Name of the OPNsense Virtual machine"
  type        = string
}

variable "opnsense_version" {
  description = "Version of OPNsense to use"
  type        = string
  default     = "25.7"
}

variable "cpu" {
  description = "Number of CPU cores for the OPNsense VM"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Amount of RAM in MB for the OPNsense VM"
  type        = number
  default     = 4096
}

variable "disk_size" {
  description = "Size of the disk in GB for the OPNsense VM"
  type        = number
  default     = 64
} 

#Voor Firewalls zijn meestal meerdere netwerk adapters nodig, dus hier een lijst van objecten gebruikt.
#Elk object in de lijst bevat het type en de rol van de netwerk adapter.
#Doormiddel van het gebruik van deze rollen is het in de toekomst eenvoudiger om de juiste netwerken toe te wijzen in de main.tf.

variable "network_adapters" {
  description = "Number of network adapters for the OPNsense VM"
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
