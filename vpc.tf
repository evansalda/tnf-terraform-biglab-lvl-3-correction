resource "aws_vpc" "big_lab" {
  cidr_block = var.cidr_vpc

  tags = {
    Name = "nuumfactory-biglab-vpc-${var.digit}"
  }
}