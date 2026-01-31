#resource is de file die je kiest, met de naam en de content die je erin wilt zetten.
#Deze template is voor een pfsense machine uit te rollen in de test/productie omgeving.

resource "local_file" "pfsense_vm" {
  filename = "pfsense_vm.txt"
  content  = "This is a Pfsense VM version ${var.pfsense_version} created by Terraform in the local environment."

}

