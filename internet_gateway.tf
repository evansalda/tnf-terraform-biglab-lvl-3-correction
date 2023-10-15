resource "aws_internet_gateway" "big_lab" {
  vpc_id = aws_vpc.big_lab.id

  tags = {
    Name = "nuumfactory-biglab-igw-${var.digit}"
  }
}