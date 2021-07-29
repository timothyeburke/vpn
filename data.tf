data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

data "local_file" "private_key" {
  filename = "server-privatekey"
}

data "local_file" "public_key" {
  filename = "client1-publickey"
}

data "aws_route53_zone" "zone" {
  name = local.zone
}

data "aws_vpc" "vpc" {
  default = true
}

data "aws_subnet" "subnet" {
  vpc_id            = data.aws_vpc.vpc.id
  availability_zone = local.az
}
