virginia_cidr = "10.10.0.0/16"
subnets = ["10.10.0.0/24", "10.10.1.0/24"]
tags = {
  "env"         = "dev"
  "owner"       = "chiquillo"
  "cloud"       = "AWS"
  "project"     = "cerberus"

}

ingress_ports_list = ["22", "80", "443"]