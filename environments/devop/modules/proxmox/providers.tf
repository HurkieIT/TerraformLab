# Configuratiefile waarin Versies, providers en sources gedefinieerd worden voor de provider local.

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 2.9.7"
    }
  }
}

# Configuratiefile voor de Proxmox provider, waarin de verbinding met de Proxmox server gedefinieerd wordt.
provider "proxmox" {
  pm_api_url          = "https://${var.proxmox_host}:${var.proxmox_port}/api2/json"
  pm_api_token_id     = var.proxmox_token_id
  pm_api_token_secret = var.proxmox_token_secret
}
