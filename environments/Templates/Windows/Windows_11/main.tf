#resource is de file die je kiest, met de naam en de content die je erin wilt zetten.

resource "local_file" "windows_vm" {
  filename = "windows_vm.txt"
  content  = "This is a Windows VM version ${var.windows_version} ${var.windows_release} ${var.edition} created by Terraform in the local environment."

}

