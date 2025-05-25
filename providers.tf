terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.10.0"
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = var.tags
  }
  access_key = var.access_key
  secret_key = var.secret_key
}
