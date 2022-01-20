resource "aws_ecr_repository" "icdl-north1-ecr" {
  name            = "icdl-north1-ecr"
  tags            = {
      "Name"      = "icdl-north1-ecr"
      "CreatedBy" = "nyasha@cloud-fundis"
  }
}
