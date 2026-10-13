terraform {
  # >= 1.10 por use_lockfile (lock nativo en S3, sin DynamoDB)
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # El bloque backend no acepta variables: el bucket debe coincidir con bootstrap/variables.tf
  backend "s3" {
    bucket       = "danielvillegas-tfstate-2026"
    key          = "s3-website/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.aws_region
}