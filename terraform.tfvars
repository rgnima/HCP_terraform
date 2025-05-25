virginia_cidr = "10.10.0.0/16"
subnets = ["10.10.0.0/24", "10.10.1.0/24"]
ingress_ports_list = ["22", "80", "443", "9443"]
tags = {
  "env" = "desa"
  "project" = "yapi"
  "region" = "virginia"
}