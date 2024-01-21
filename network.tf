resource "aws_route_table" "Forall" {
  vpc_id = aws_vpc.Big_Network.id

  tags = {
    Name = "VPC Route Table"
  }
}


resource "aws_route" "r" {
  route_table_id         = aws_route_table.Forall.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet.id
  depends_on             = [aws_route_table.Forall]
}


resource "aws_route_table" "Application" {
  vpc_id = aws_vpc.Big_Network.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet.id
  }

  tags = {
    Name = "Application Route Table"
  }
}

resource "aws_route_table_association" "PublicTable" {
  route_table_id = aws_route_table.Application.id
  subnet_id      = aws_subnet.public1.id
}

resource "aws_route_table_association" "PublicTables" {
  route_table_id = aws_route_table.Application.id
  subnet_id      = aws_subnet.public2.id
}


resource "aws_eip" "lb" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public1.id

  tags = {
    Name = "gw NAT"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.Big_Network.id

  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.example.id
}

resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_associations" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private_route_table.id
}