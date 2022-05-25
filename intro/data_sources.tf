variable "vpc_id" {
    type = string
    default = "vpc-09f5a680d6aa1a5b3"
}

data "aws_vpc" "default_vpc" {
  #id = var.vpc_id
    filter {
        name   = "tag:Name"
        values = ["toto"]
    }
}

output "vpc" {
    value = data.aws_vpc.default_vpc
}

resource "aws_subnet" "example" {
  vpc_id            = data.aws_vpc.default_vpc.id
  availability_zone = "eu-central-1b"
  cidr_block        = cidrsubnet(data.aws_vpc.default_vpc.cidr_block, 4, 1)
}
