#resource is de file die je kiest, met de naam en de content die je erin wilt zetten.
#Deze template is voor een OPNsense machine uit te rollen in de test/productie omgeving.

resource "local_file" "opnsense_vm" {
  filename = "opnsense_vm.txt"

  content = "This is an OPNsense VM version ${var.opnsense_version} with ${var.cpu} CPU cores and ${var.memory} MB RAM with ${var.disk_size} GB disk space. Network adapters: ${join(", ", [for a in var.network_adapters : "${a.role}(${a.adapter_type})"])}. Created by Terraform in the local environment."

}

