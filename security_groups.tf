#ELB SG
resource "aws_security_group" "lb" {
  name   = "nuumfactory-biglab-${var.environnement}-lb-sg-${var.digit}"
  vpc_id = aws_vpc.big_lab.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nuumfactory-biglab-${var.environnement}-lb-sg-${var.digit}"
  }
}

#EC2 SG
resource "aws_security_group" "front" {
  name   = "nuumfactory-biglab-${var.environnement}-ec2-sg-${var.digit}"
  vpc_id = aws_vpc.big_lab.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.lb.id]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["90.65.42.76/32"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["5.50.34.152/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nuumfactory-biglab-${var.environnement}-ec2-sg-${var.digit}"
  }
}

#MEMCACHED SG
resource "aws_security_group" "memcached" {
  name   = "nuumfactory-biglab-${var.environnement}-memcached-sg-${var.digit}"
  vpc_id = aws_vpc.big_lab.id

  ingress {
    from_port       = 11211
    to_port         = 11211
    protocol        = "tcp"
    security_groups = [aws_security_group.front.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nuumfactory-biglab-${var.environnement}-memcached-sg-${var.digit}"
  }
}