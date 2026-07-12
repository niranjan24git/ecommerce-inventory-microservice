terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"  # Mumbai Region
}

resource "aws_instance" "devops_server" {
  ami           = "ami-00bb6a80f01f03502"  # Ubuntu 24.04 LTS
  instance_type = "t3.micro"                 # Free-tier eligible

  tags = {
    Name = "DevOps-Production-Server"
  }
}

output "server_public_ip" {
  value       = aws_instance.devops_server.public_ip
  description = "The public IP address of your live cloud server"
}