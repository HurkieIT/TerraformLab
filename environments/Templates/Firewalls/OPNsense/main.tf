#resource is de file die je kiest, met de naam en de content die je erin wilt zetten.
#Deze template is voor een OPNsense machine uit te rollen in de test/productie omgeving.

resource "local_file" "opnsense_vm" {
  filename = "opnsense_vm.txt"
  content  = "This is an OPNsense VM version ${var.opnsense_version} created by Terraform in the local environment."

}

