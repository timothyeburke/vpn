terraform {
  backend "s3" {
    bucket = "vpn-tf-state"
    key    = "vpn-tf-state"
    region = "us-east-2"
  }
}
