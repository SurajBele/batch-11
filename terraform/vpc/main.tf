Primary navigation
Homepage
Project
T
terraform

Pinned
Issues
0
Merge requests
0

Manage

Plan

Code

Build

Secure

Deploy

Operate

Monitor

Analyze

Settings
Security Alert: Change your GitLab password
Your GitLab.com account password may be compromised due to a data breach on another service or platform. Please change your password immediately.
Suraj Bele
terraform
cdec-b1
terraform
modules
vpc
main.tf
main.tf
suraj's avatar
--- Auto Git Commit ---
Suraj Bele authored 21 Jul 2023
698bd4f5
main.tf
892 B
resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
    tags = {
    Name = "${var.project}_module"
  }
}
resource "aws_subnet" "pvt-subnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.pvt_subnet_cidr
  tags = {
    Name = "${var.project}_pvt_subnet"
  }
  map_public_ip_on_launch = true
}
resource "aws_subnet" "pub-subnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.pub_subnet_cidr
  tags = {
    Name = "${var.project}_pub_subnet"
  }
  map_public_ip_on_launch = true
}
resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "${var.project}_igw"
    env = var.env
  }
}
resource "aws_default_route_table" "myRT" {
  default_route_table_id = "${aws_vpc.myvpc.default_route_table_id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }
  tags = {
    Name = "${var.project}_myRT"
  }
}