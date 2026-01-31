#resource is de file die je kiest, met de naam en de content die je erin wilt zetten.

resource "local_file" "windows_server_vm" { 
  filename = "windows_server_vm.txt"
  content  = "This is a Windows Server file created by Terraform in the local environment."


}

