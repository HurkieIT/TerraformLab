#resource is de file die je kiest, met de naam en de content die je erin wilt zetten.

resource "local_file" "windows_server_vm" { 
  filename = "windows_server_vm.txt"
  content = "This is a Windows Server VM version ${var.windows_server_version} with ${var.cpu} CPU cores and ${var.memory} MB RAM with ${var.disk_size} GB disk space. Network adapters: ${join(", ", [for a in var.network_adapters : "${a.role}(${a.adapter_type})"])}. Created by Terraform in the local environment."


}

