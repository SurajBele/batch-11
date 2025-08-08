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

variable "aws_vpc_cidr" {
  default = "10.0.0.0/16"
}