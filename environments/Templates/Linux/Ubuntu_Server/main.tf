#resource is de file die je kiest, met de naam en de content die je erin wilt zetten.

resource "local_file" "example" {
  filename = "example.txt"
  content  = "This is an example file created by Terraform in the local environment."


}

