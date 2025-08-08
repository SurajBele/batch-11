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

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "pluto"
  }
}

resource "aws_subnet" "public-sub" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
  
  tags = {
    Name = "pluto-pub-sub"
  }
}
resource "aws_subnet" "private-sub" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "pluto-pvt-sub"
  }
}
res