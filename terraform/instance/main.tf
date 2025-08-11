resource "aws_instance" "module-ins" {
    ami = var.ami
    instance_type = var.instance_type
}