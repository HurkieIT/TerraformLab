# Binnen deze file worden variables gedefineerd, zoals environments en regions waarin verschillende types of descriptions aan toegevoegd worden.

variable "environment_name" {
  description = "Name of the environment"
  type        = string
}

variable "region" {
  description = "Optional region (future use)"
  type        = string
  default     = null
}
