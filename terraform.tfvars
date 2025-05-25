virginia_cidr = "10.10.0.0/16"
#public_subnet  = "10.10.0.0/24"
#private_subnet = "10.10.1.0/24"
subnets = ["10.10.0.0/24", "10.10.1.0/24"]
tags = {
  "env"         = "dev"
  "owner"       = "chiquillo"
  "cloud"       = "AWS"
  "IAC_version" = "1.3.6"
  "project"     = "cerberus"
  "region"      = "virginia"
}

ec2_specs = {
  ami           = "ami-0f88e80871fd81e91"
  instance_type = "t2.micro"

}
ingress_ports_list = ["22", "80", "443"]