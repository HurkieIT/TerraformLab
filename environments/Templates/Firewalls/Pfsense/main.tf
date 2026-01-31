#resource is de file die je kiest, met de naam en de content die je erin wilt zetten.
#Deze template is voor een pfsense machine uit te rollen in de test/productie omgeving.

resource "local_file" "pfsense_vm" {
  filename = "pfsense_vm.txt"
  content = "This is a Pfsense VM version ${var.pfsense_version} with ${var.cpu} CPU cores and ${var.memory} MB RAM with ${var.disk_size} GB disk space. Network adapters: ${join(", ", [for a in var.network_adapters : "${a.role}(${a.adapter_type})"])}. Created by Terraform in the local environment."

}

