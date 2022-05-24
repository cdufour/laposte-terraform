resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-christooophe-training-demo1"
  
  tags = {
    #Name = var.age < 18 ? "Baby" : var.author
    Name = "Formation Terraform"
    City = var.city
    #Ip = output
    # todo: reference à l'output ici...
  }
}

resource "aws_instance" "vm" {
  instance_type = "t2.micro"
  #ami = "ami-015c25ad8763b2f11" // ami pour ubuntu 22.04 x86
  ami = "ami-09439f09c55136ecf"
  security_groups = [aws_security_group.postgres.name]
}

resource "aws_security_group" "postgres" {
  name        = "postgres"

  ingress {
    from_port        = var.postgres_port
    to_port          = var.postgres_port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}