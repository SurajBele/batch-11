output "instance_public_ip" {
  value = module.aws_instance.my-instance.public_ip
}