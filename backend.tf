terraform {
  backend "s3" {
    bucket = "terraform-state-prasanth-2026"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"

    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}