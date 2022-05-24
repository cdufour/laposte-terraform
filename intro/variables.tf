variable "city" {
  type = string
  default = "Montpellier"
}

variable "postgres_port" {
  type = number
  default = 5432
}

variable "students" {
  type = list(string)
  default = ["aramis", "athos", "porthos"]
}