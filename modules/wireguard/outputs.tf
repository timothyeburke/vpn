output "public_ip" {
  value = aws_eip.wireguard.public_ip
}
