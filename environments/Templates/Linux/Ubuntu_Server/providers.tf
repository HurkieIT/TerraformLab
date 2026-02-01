# Configuratiefile waarin Versies, providers en sources gedefinieerd worden voor de provider local.

terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 2.9.7"
    }
  }
}
