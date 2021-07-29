module "wireguard" {
  source = "./modules/wireguard"

  region                 = local.region
  vpc_id                 = data.aws_vpc.vpc.id
  subnet_ids             = [data.aws_subnet.subnet.id]
  ssh_key_id             = local.key
  wg_server_private_key  = chomp(data.local_file.private_key.content)
  ingress_ip             = chomp(data.http.myip.body)
  instance_type          = local.instance_type
  use_ssm                = true
  use_eip                = true
  use_route53            = true
  route53_hosted_zone_id = data.aws_route53_zone.zone.zone_id
  route53_record_name    = local.fqdn

  wg_clients = [{
    friendly_name = local.client
    public_key    = chomp(data.local_file.public_key.content)
    client_ip     = "10.8.0.2/32"
  }]
}
