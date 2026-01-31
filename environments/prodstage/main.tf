#Binnen deze staging/PO omgeving worden op basis van de gemaakte configuraties productieomgevingen gerealisaeerd.
#De functie hiervan is dat alle dat goed door de devop omgeving is getest, nu uiteindelijk in productie uitgerold kan worden.

resource "local_file" "example" {
  filename = "example.txt"
  content  = "This is an example file created by Terraform in the local environment."

}

