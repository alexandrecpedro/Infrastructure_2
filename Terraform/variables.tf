variable "user" {
  default = process.env.USER
}

variable "region" {
  default = process.env.REGION
}

variable "ami" {
  default = process.env.AMI
}

variable "instance_type" {
  default = process.env.INSTANCE_TYPE
}

variable "ip_internet" {
  # Every internet IP can access
  default = process.env.IP_INTERNET
}