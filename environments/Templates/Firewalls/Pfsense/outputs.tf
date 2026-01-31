# Output file voor de local environment

output "pfsense_version_used" {
  description = "The Pfsense version used in the local environment."
  value = var.pfsense_version
}

output "file_path" {
  description = "The path to the created Pfsense VM file."
  value = local_file.pfsense_vm.filename
}