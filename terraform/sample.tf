provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "myinstance" {
    ami = "ami-020cba7c55df1f615"
    instance_type = "t2.micro"
    key_name = "id_rsa"
    vpc_security_group_ids = []
  
}