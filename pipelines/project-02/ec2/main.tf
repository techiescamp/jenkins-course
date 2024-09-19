terraform {
  backend "s3" {}
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-05134c8ef96964280"
  instance_type = "t3.micro"
  monitoring    = true

  tags = {
    Name = "EC2Instance"
  }

  key_name = "aswin-key"
  vpc_security_group_ids = ["sg-0fe4363da3994c100"]

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }
}
