variable "virginia_cidr" {
  description = "CIDR Virginia"
  type        = string
}

variable "subnets" {
  description = "segmentos de red para subntes"
  type        = list(string)
}


variable "ingress_ports_list" {
  description = "Lista de puertos de entrada"
  type        = set(string)
}

variable "access_key" {
}
variable "secret_key" {
  
}