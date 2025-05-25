variable "virginia_cidr" {
  description = "CIDR Virginia"
  type        = string
}
/*
variable "public_subnet" {
  description = "Public Subnet"
  type        = string
}
variable "private_subnet" {
  description = "Private Subnet"
  type        = string
} */
variable "subnets" {
  description = "segmentos de red para subntes"
  type        = list(string)
}

variable "tags" {
  description = "Tags del proyecto"
  type        = map(string)
}

variable "ec2_specs" {
  description = "values for ec2 instance"
  type        = map(string)
}
variable "instancias" {
  description = "Nombre de la instancia"
  #type        = set(string)
  type = list(string)
  #default     = ["apache","mysql","jumpserver"]
  default = ["apache"]
}
variable "cadena" {
  type    = string
  default = "ami-123,AMI-123,ami-12f"
}
variable "palabras" {
  type    = list(string)
  default = ["hola", "como", "estan"]
}
variable "enable_monitoring" {
  description = "Enable detailed monitoring"
  type        = number
  default     = 1

}

variable "ingress_ports_list" {
  description = "Lista de puertos de entrada"
  type        = set(string)
}