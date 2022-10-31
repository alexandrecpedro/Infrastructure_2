resource "aws_key_pair" "alexandre_terraform_key" {
  key_name = "${var.user}_terraform_aws"
  # Key file (get our SSH key)
  public_key = file("terraform-aws.pub")
}