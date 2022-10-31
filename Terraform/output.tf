# Public EC-2 Instances
output "instances_ec2" {
  value = aws_instance.terraform_resource_name.*.public_ip
}
# Private EC-2 Instances
output "instances_ec2_private" {
  value = aws_instance.terraform_resource_name.*.private_ip
}