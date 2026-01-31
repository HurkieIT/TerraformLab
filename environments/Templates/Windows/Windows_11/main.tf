#resource is de file die je kiest, met de naam en de content die je erin wilt zetten.

resource "local_file" "windows_vm" {
  filename = "${var.windows_vm}.txt"

  content = "This is a Windows ${var.windows_version} ${var.windows_release} ${var.edition} VM named '${var.windows_vm}' with ${var.cpu} CPU cores, ${var.memory} MB RAM and ${var.disk_size} GB disk space. Created by Terraform in the local environment."
}

