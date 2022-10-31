# PERMISSION RULES
# Public SSH
resource "aws_security_group" "sg_acess_ssh_public" {
  description = "allow SSH port for Internet"

  ingress {
    cidr_blocks = [var.ip_internet]
    description = "SSH port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  egress {
    cidr_blocks = [var.ip_internet]
    description = "SSH port"
    from_port   = 0
    to_port     = 0
    # All protocols (-1)
    protocol = -1
  }
  tags = {
    "Name" = "${var.user}-sg_acess_ssh_public"
  }
}

# Web Access
resource "aws_security_group" "sg_web_acess" {
  ingress {
    description = "HTTP port"
    cidr_blocks = [var.ip_internet]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
  tags = {
    "Name" = "${var.user}-sg_web_acess"
  }
}