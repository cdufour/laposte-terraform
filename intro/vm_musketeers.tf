resource "aws_instance" "musketeers" {
  #count = length(var.students)
  count = 0
  instance_type = "t2.micro"
  #ami = "ami-015c25ad8763b2f11" // ami pour ubuntu 22.04 x86
  ami = "ami-09439f09c55136ecf"
  security_groups = [aws_security_group.postgres.name]
  tags = {
      Name = var.students[count.index] 
  }
}
