resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    Name = "VPC-${local.sufix}"

  }

}
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_virginia.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet-${local.sufix}"
  }

}
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1]
  tags = {
    Name = "Private Subnet-${local.sufix}"
  }
  # ej dependncia explicita
  depends_on = [aws_subnet.public_subnet]

}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_virginia.id

  tags = {
    Name = "IGW-VPC-Virginia"
  }
}
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc_virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "RT-VPC-Virginia-${local.sufix}"
  }
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "allow_ports" {
  name        = "allow_tls"
  description = "Allow SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_virginia.id

  tags = {
    Name = "allow_pots"
  }
}


resource "aws_vpc_security_group_ingress_rule" "ingress_rules" {
  security_group_id = aws_security_group.allow_ports.id
  ip_protocol       = "tcp"
  for_each          = var.ingress_ports_list
  from_port         = each.value
  to_port           = each.value
  cidr_ipv4         = "0.0.0.0/0"
  description       = "Allow inbound traffic on port ${each.value}"

}



resource "aws_vpc_security_group_egress_rule" "egress_all" {
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  security_group_id = aws_security_group.allow_ports.id
  description       = "Allow all outbound traffic"
}
