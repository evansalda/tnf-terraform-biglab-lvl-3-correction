terraform {
  backend "s3" {
    bucket  = "nuumfactory-terraform-backend"
    key     = "terraform-biglab-00.tfstate"
    region  = "eu-west-3"
    profile = "nuumfactory-student"
  }
}