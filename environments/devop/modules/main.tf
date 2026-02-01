#Binnen deze devop omgeving worden op basis van de gemaakte configuraties testomgevingen gerealisaeerd.
#De functie hiervan is om alles dat in de uiteindelijke PO omgeving uitgerold wordt grondig getest te hebben.

resource "local_file" "example" {
  filename = "example.txt"
  content  = "This is an example file created by Terraform in the local environment."


}

