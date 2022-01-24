resource "aws_ecr_repository" "icdl-north1-ecr" {
  name            = "icdl-north1-ecr"

    encryption_configuration {
        encryption_type = "AES256"
    }

    image_scanning_configuration {
        scan_on_push = false
    }
  tags            = {
      "Name"      = "icdl-north1-ecr"
      "CreatedBy" = "nyasha@cloud-fundis"
  }
}

/*
resource "aws_ecr_repository" "icdl" {
    arn                  = "arn:aws:ecr:eu-west-1:813260210012:repository/icdl"
    id                   = "icdl"
    image_tag_mutability = "MUTABLE"
    name                 = "icdl"
    registry_id          = "813260210012"
    repository_url       = "813260210012.dkr.ecr.eu-west-1.amazonaws.com/icdl"
    tags                 = {
        "CreatedBy" = "nyasha@cloud-fundis"
        "Name"      = "icdl-north-ecr"
    }
    tags_all             = {
        "CreatedBy" = "nyasha@cloud-fundis"
        "Name"      = "icdl-north-ecr"
    }

    encryption_configuration {
        encryption_type = "AES256"
    }

    image_scanning_configuration {
        scan_on_push = false
    }
}*/