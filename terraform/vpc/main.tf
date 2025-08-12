resource "aws_vpc" "myvpc" {
cidr_block = var.vpc_cidr
}
resource "aws_subnet" "pub-sub" {
  
}