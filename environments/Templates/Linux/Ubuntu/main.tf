#resource is de file die je kiest, met de naam en de content die je erin wilt zetten.
#Deze template is voor een Ubuntu machine uit te rollen in de test/productie omgeving.

resource "local_file" "ubuntu_vm" {
  filename = "ubuntu_vm.txt"
  content  = "This is an Ubuntu VM version ${var.ubuntu_version} created by Terraform in the local environment."

}

