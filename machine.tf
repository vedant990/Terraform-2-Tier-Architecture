resource "aws_instance" "public_ec2" {
  ami                    = "ami-0c7217cdde317cfec"  
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public1.id

  tags = {
    Name = "Public EC2 Instance"
  }
}


resource "aws_db_instance" "rds_instance" {
  identifier             = "my-rds-instance"
  engine                 = "mysql"
  instance_class         = "db.t2.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  username               = "admin"
  password               = "admin1234567"
  db_subnet_group_name   = aws_db_subnet_group.default.id

  tags = {
    Name = "RDS Instance"
  }
}
