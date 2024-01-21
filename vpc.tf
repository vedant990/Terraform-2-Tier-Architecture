resource "aws_vpc" "Big_Network" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}

