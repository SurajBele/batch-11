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

module "my_instance" {
  source = "./terraform/modules/instance"
  image_id = var.image_id 
  key_pair = var.key_pair
  instance_type = var.instance_type
  project = var.project
  env = var.environment
  subnet_id = module.my_vpc_module.pub_subnet_id
  sg_ids = [aws_security_group.mysg.id]
}

