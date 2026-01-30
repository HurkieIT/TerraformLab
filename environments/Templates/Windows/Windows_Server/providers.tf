# Configuratiefile waarin Versies, providers en sources gedefinieerd worden voor de provider local.

terraform {
  required_version = "value"

  required_providers {
    local = [{
      source  = "hashicorp/local"
      version = "value"
    }]
  }
}

provider "local" {
  
}