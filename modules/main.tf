provider "aws" {
  region                  = "eu-central-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}

module "buckets_oliv" {
    source = "./buckets"
    
    student = "olivier-clavel"
}

module "buckets_claudio" {
    source = "./buckets"
    
    student = "claude-debussy"
}

resource "aws_vpc" "aws_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "toto"
  }
}