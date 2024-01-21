resource "aws_subnet" "public1" {
  vpc_id           = aws_vpc.Big_Network.id
  tags = {
    Name = "Server Number 1"
  }
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block       = "10.0.1.0/24"  # Replace this with your desired CIDR block
}

resource "aws_subnet" "public2" {
  vpc_id           = aws_vpc.Big_Network.id
  tags = {
    Name = "Server Number 2"
  }
  availability_zone = data.aws_availability_zones.available.names[2]
  cidr_block       = "10.0.2.0/24"  # Replace this with your desired CIDR block
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.Big_Network.id
  tags = {
    Name = "Server Number 3"
  }
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block       = "10.0.3.0/24"  # Replace this with your desired CIDR block
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.Big_Network.id
  tags = {
    Name = "Server Number 4"
  }
  availability_zone = data.aws_availability_zones.available.names[2]
  cidr_block       = "10.0.4.0/24"  # Replace this with your desired CIDR block
}

resource "aws_internet_gateway" "internet" {
  vpc_id     = aws_vpc.Big_Network.id
  depends_on = [aws_vpc.Big_Network]
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id]

  tags = {
    Name = "My DB subnet group"
  }
}