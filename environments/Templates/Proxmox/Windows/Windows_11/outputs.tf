# Output file voor de local environment

output "windows_vm_file_path" {
  description = "The path to the created Windows VM file."
  value       = local_file.windows_vm.filename
}

output "windows_version_used" {
  description = "The Windows version used in the local environment."
  value       = var.windows_version
}

output "edition_used" {
  description = "The Windows 11 edition used in the local environment."
  value       = var.edition
}

output "release_used" {
  description = "The Windows release used in the local environment."
  value       = var.windows_release
}

output "vm_resources" {
  description = "The resources allocated for the Windows VM."
  value = {
    cpu    = var.cpu
    memory = var.memory
    disk   = var.disk_size
  }
}

