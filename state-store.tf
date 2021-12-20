terraform {
  backend "s3" {
    bucket = "icdl-za-backups"
    key    = "nyasha_terraform_icdl/terraform.tfstate"
    region = "af-south-1"

    dynamodb_table = "icdl-terraform-state-table"
  }
}