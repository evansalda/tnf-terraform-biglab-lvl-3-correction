#Public subnet 1
resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.big_lab.id
  availability_zone = "eu-west-3a"
  cidr_block        = var.cidr_public_subnet_1

  tags = {
    Name = "nuumfactory-biglab-public-subnet-1-${var.digit}"
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public_1.id
}

#Public subnet 2
resource "aws_subnet" "public_2" {
  vpc_id            = aws_vpc.big_lab.id
  availability_zone = "eu-west-3b"
  cidr_block        = var.cidr_public_subnet_2

  tags = {
    Name = "nuumfactory-biglab-public-subnet-2-${var.digit}"
  }
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public_2.id
}

#Private subnet 1
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.big_lab.id
  availability_zone = "eu-west-3a"
  cidr_block        = var.cidr_private_subnet_1

  tags = {
    Name = "nuumfactory-biglab-private-subnet-1-${var.digit}"
  }
}

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_1.id
}

#Private subnet 2
resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.big_lab.id
  availability_zone = "eu-west-3b"
  cidr_block        = var.cidr_private_subnet_2

  tags = {
    Name = "nuumfactory-biglab-private-subnet-2-${var.digit}"
  }
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_2.id
}

#Private subnet 3
resource "aws_subnet" "private_3" {
  vpc_id            = aws_vpc.big_lab.id
  availability_zone = "eu-west-3a"
  cidr_block        = var.cidr_private_subnet_3

  tags = {
    Name = "nuumfactory-biglab-private-subnet-3-${var.digit}"
  }
}

resource "aws_route_table_association" "private_3" {
  subnet_id      = aws_subnet.private_3.id
  route_table_id = aws_route_table.private_3.id
}

#Private subnet 4
resource "aws_subnet" "private_4" {
  vpc_id            = aws_vpc.big_lab.id
  availability_zone = "eu-west-3b"
  cidr_block        = var.cidr_private_subnet_4

  tags = {
    Name = "nuumfactory-biglab-private-subnet-4-${var.digit}"
  }
}

resource "aws_route_table_association" "private_4" {
  subnet_id      = aws_subnet.private_4.id
  route_table_id = aws_route_table.private_4.id
}