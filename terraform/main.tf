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