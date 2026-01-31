#resource is de file die je kiest, met de naam en de content die je erin wilt zetten.
#Deze template is voor een Ubuntu server machine uit te rollen in de test/productie omgeving.

resource "local_file" "ubuntu_server_vm" {
  filename = ${var.ubuntu_server_vm}.txt

  content = "This is an Ubuntu Server VM version ${var.ubuntu_server_version} with ${var.cpu} CPU cores and ${var.memory} MB RAM with ${var.disk_size} GB disk space. Created by Terraform in the local environment."


}