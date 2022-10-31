# WORKING WITH AWS (Amazon Web Service)
# Provider could be Azure, GCP, Docker, ...
provider "aws" {
  # Part 1 - Define a region
  region = var.region
  # Part 2 - Need an user & password
  access_key = process.env.ACCESS_KEY
  secret_key = process.env.SECRET_KEY
  # Part 3 - Resource to be created (AMI ID reference)
}