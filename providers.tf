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
}
provider "aws" {
  alias  = "ohio"
  region = "us-east-2"
}