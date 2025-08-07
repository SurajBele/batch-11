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
    ami = "ami-020cba7c55df1f615"
    instance_type = var.instance_type
    key_name = "id_rsa"
    vpc_security_group_ids = ["sg-0d34c3d2b6fa6492a", "sg-0d34c3d2b6fa6492a"]
    tags = {
      Name = "spider-terraform"
      env = "devops"
    } 
}

variable "instance_type" {
  default = "t2.micro"
}

output "instance_public_ip" {
  default
}