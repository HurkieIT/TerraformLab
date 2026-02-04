# Output file voor de local environment

output "opnsense_version_used" {
  description = "The OPNsense version used in the local environment."
  value = var.opnsense_version
}

output "file_path" {
  description = "The path to the created OPNsense VM file."
  value = local_file.opnsense_vm.filename
}

output "vm_resources" {
  description = "The resources allocated for the OPNsense VM."
  value = {
    cpu    = var.cpu
    memory = var.memory
    disk   = var.disk_size
  }
}
output "network_adapters_configured" {
  description = "The network adapters configured for the OPNsense VM."
  value       = var.network_adapters
}

