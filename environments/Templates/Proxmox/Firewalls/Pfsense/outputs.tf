# Output file voor de local environment

output "pfsense_version_used" {
  description = "The Pfsense version used in the local environment."
  value = var.pfsense_version
}

output "file_path" {
  description = "The path to the created Pfsense VM file."
  value = local_file.pfsense_vm.filename
}

output "vm_resources" {
  description = "The resources allocated for the Pfsense VM."
  value = {
    cpu    = var.cpu
    memory = var.memory
    disk   = var.disk_size
  }
}

output "network_adapters_configured" {
  description = "The network adapters configured for the Pfsense VM."
  value       = var.network_adapters
}

