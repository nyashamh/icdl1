terraform {
  backend "s3" {
    bucket = "icdl-backups"
    key    = "nyasha_terraform_icdl/terraform.tfstate"
    region = "eu-west-1"

    dynamodb_table = "icdl-north-sstate-table"
  }
}