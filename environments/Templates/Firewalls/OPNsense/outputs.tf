# Output file voor de local environment

output "opnsense_version_used" {
  description = "The OPNsense version used in the local environment."
  value = var.opnsense_version
}

output "file_path" {
  description = "The path to the created OPNsense VM file."
  value = local_file.opnsense_vm.filename
}