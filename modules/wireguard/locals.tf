locals {
  client_configs = [for client in var.wg_clients : templatefile(
    "${path.module}/templates/client-data.tpl",
    {
      friendly_name        = client.friendly_name
      client_pub_key       = client.public_key
      client_ip            = client.client_ip
      persistent_keepalive = var.wg_persistent_keepalive
    }
  )]
}
