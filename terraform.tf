terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
  backend "s3" {
    bucket = "vpn-tf-state"
    key    = "vpn-tf-state"
    region = "us-east-2"
  }
}
