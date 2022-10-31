# Everything done in Terraform is a resource
resource "aws_instance" "terraform_resource_name" {
  count = 2
  # AMI ID (Ubuntu)
  ami = var.ami
  # Instance type
  instance_type = var.instance_type
  # Key
  key_name = "${var.user}_terraform_aws"
  # Identify our resource (count = how many machines we want to create)
  tags = {
    "Name" = "${var.user}-ec2-${count.index}"
  }
  # Apply security rules
  vpc_security_group_ids = [aws_security_group.sg_acess_ssh_public.id, aws_security_group.sg_web_acess.id]

  # Install Apache Server and Docker
  user_data = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install apache2 -y \
	\
	sudo apt-get update
	sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
	sudo mkdir -p /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
  EOF
}
