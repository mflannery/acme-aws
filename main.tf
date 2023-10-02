terraform {
  cloud {
    organization = "mikedemo1"

    workspaces {
      name = "Acme-aws"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0bb4c991fa89d4b9b"
  instance_type = "t2.small"

  tags = {
    Name = "ACME_Demo_App_Server"
  }
}
