# Configuratiefile waarin Versies, providers en sources gedefinieerd worden voor de provider local.

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  pm_api_url          = "https://${var.proxmox_host}:${var.proxmox_port}/api2/json"
  pm_api_token_id     = var.proxmox_token_id
  pm_api_token_secret = var.proxmox_token_secret

  pm_tls_insecure = true
}
