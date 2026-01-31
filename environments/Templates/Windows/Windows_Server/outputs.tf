# Output file voor de local environment

output "windows_server_version_used" {
  value = local_file.windows_server_vm.filename
}
