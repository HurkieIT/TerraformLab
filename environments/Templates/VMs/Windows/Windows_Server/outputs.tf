# Output file voor de local environment

output "windows_server_version_used" {
  description = "The Windows Server version used."
  value       = var.windows_server_version
}

output "edition_used" {
  description = "The Windows Server edition used."
  value       = var.edition
}

output "file_path" {
  description = "The path to the created Windows Server VM file."
  value       = local_file.windows_server_vm.filename
}

output "vm_resources" {
  description = "The resources allocated for the Windows Server VM."
  value = {
    cpu    = var.cpu
    memory = var.memory
    disk   = var.disk_size
  }
}


