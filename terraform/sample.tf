terraform {
    backend "s3" {
        bucket = "batch-11-terraform"
        region = "us-east-1"
        key = "terraform.tfstate" 
    }
}
provider "aws" {
  region = "us-east-1"
}
provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "myinstance" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_pair
    vpc_security_group_ids = [aws_security_group.terra-sg.id]
    tags = {
      Name = "spider-terraform"
      env = "devops"
    } 
}
resource "aws_instance" "myinstance" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_pair
    vpc_security_group_ids = [aws_security_group.terra-sg.id]
    tags = {
      Name = "spider-terraform"
      env = "devops"
    } 
}
data "aws_se" "name" {
  
}
resource "aws_security_group" "terra-sg" {
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "TCP"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terra-sg"
  }
}

variable "instance_type" {
  default = "t2.micro"
}
variable "ami" {
  default = "ami-020cba7c55df1f615"
}
variable "region" {
  default = "us-east-1"
}

variable "key_pair"{
    default = "test"
}

output "instance_public_ip" {
  value = aws_instance.myinstance.public_ip
}