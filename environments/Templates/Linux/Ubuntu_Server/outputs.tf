# Output file voor de local environment

output "ubuntu_server_version" {
  description = "The Ubuntu version used in the local environment."
  value = var.ubuntu_server_version
}

output "file_path" {
  description = "The path to the created Ubuntu VM file."
  value = local_file.ubuntu_server_vm.filename
}

output "vm_resources" {
  description = "The resources allocated for the Pfsense VM."
  value = {
    cpu    = var.cpu
    memory = var.memory
    disk   = var.disk_size
  }
}