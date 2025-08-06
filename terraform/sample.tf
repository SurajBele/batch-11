provider "aws" {
  region = "us-east-1"

}
resource "aws_instance" "myinstance" {
    ami = "ami-020cba7c55df1f615"
    instance_type = "t2.micro"
    key_name = "id_rsa"
    vpc_security_group_ids = ["sg-0d34c3d2b6fa6492a", "sg-0d34c3d2b6fa6492a"]
    availability_zone = 
    subnet_id = 
    vpc_id = 
    user_data = 
  
}