resource "aws_route_table" "public_1" {
  vpc_id = aws_vpc.big_lab.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.big_lab.id
  }

  tags = {
    Name = "nuumfactory-biglab-public-rtb-1-${var.digit}"
  }
}

resource "aws_route_table" "public_2" {
  vpc_id = aws_vpc.big_lab.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.big_lab.id
  }

  tags = {
    Name = "nuumfactory-biglab-public-rtb-2-${var.digit}"
  }
}

resource "aws_route_table" "private_1" {
  vpc_id = aws_vpc.big_lab.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.public_1.id
  }

  tags = {
    Name = "nuumfactory-biglab-private-rtb-1-${var.digit}"
  }
}

resource "aws_route_table" "private_2" {
  vpc_id = aws_vpc.big_lab.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.public_2.id
  }

  tags = {
    Name = "nuumfactory-biglab-private-rtb-2-${var.digit}"
  }
}

resource "aws_route_table" "private_3" {
  vpc_id = aws_vpc.big_lab.id

  tags = {
    Name = "nuumfactory-biglab-private-rtb-3-${var.digit}"
  }
}

resource "aws_route_table" "private_4" {
  vpc_id = aws_vpc.big_lab.id

  tags = {
    Name = "nuumfactory-biglab-private-rtb-4-${var.digit}"
  }
}