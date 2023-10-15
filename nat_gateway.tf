resource "aws_eip" "public_1" {
  domain = "vpc"
}

resource "aws_nat_gateway" "public_1" {
  allocation_id = aws_eip.public_1.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "nuumfactory-biglab-natgw-1-${var.digit}"
  }
  depends_on = [aws_internet_gateway.big_lab]
}

resource "aws_eip" "public_2" {
  domain = "vpc"
}

resource "aws_nat_gateway" "public_2" {
  allocation_id = aws_eip.public_2.id
  subnet_id     = aws_subnet.public_2.id

  tags = {
    Name = "nuumfactory-biglab-natgw-2-${var.digit}"
  }
  depends_on = [aws_internet_gateway.big_lab]
}