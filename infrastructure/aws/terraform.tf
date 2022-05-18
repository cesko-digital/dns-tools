terraform {
  required_version = "1.1.9"

  required_providers {
    aws = "~> 3.0"
  }

  backend "s3" {
    bucket = "cesko-digital-dns-tools-terraform-backend"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}
