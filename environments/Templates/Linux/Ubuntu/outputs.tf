# Output file voor de local environment

output "ubuntu_version_used" {
  description = "The Ubuntu version used in the local environment."
  value = var.ubuntu_version
}

output "file_path" {
  description = "The path to the created Ubuntu VM file."
  value = local_file.ubuntu_vm.filename
}