resource "aws_vpc" "myvpc" {
cidr_block = var.vpc_cidr
}
resource "aws_subnet" "pub-sub" {
vpc_id = aws_vpc.myvpc.id

}