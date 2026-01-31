# Output file voor de local environment

output "windows_vm_file_path" {
  description = "The path to the created Windows VM file."
  value       = local_file.windows_vm.filename
}

