resource "aws_ecr_repository" "icdl-north-ecr" {
  name            = "icdl-north-ecr"
  tags            = {
      "Name"      = "icdl-north-ecr"
      "CreatedBy" = "nyasha@cloud-fundis"
  }
}

resource "aws_ecr_repository" "icdl" {
  name            = "icdl"
  tags            = {
      "Name"      = "icdl-north-ecr"
      "CreatedBy" = "nyasha@cloud-fundis"
  }
}