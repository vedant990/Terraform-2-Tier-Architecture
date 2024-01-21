resource "aws_lb" "load_balancer" {
  name               = "loadbalancer"
  load_balancer_type = "application"
  internal           = false
  security_groups    = [aws_security_group.load_balancer_security_group.id] 
  idle_timeout       = 400
  subnets            = [aws_subnet.public1.id , aws_subnet.public2.id]

}

resource "aws_lb_target_group" "target_group" {
  name     = "target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.Big_Network.id  

  lifecycle {
    ignore_changes = [name]
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
  }
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

resource "aws_security_group" "load_balancer_security_group" {
  vpc_id   = aws_vpc.Big_Network.id  

  ingress {
    from_port        = 80
    to_port          = 80
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
}