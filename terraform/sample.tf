provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "myinstance" {
    ami = "ami-020cba7c55df1f615"
  
}