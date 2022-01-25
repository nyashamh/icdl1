resource "aws_ecr_repository" "icdl-north-ecr" {
  name            = "icdl-north-ecr"

    encryption_configuration {
        encryption_type = "AES256"
    }

    image_scanning_configuration {
        scan_on_push = false
    }
  tags            = {
      "Name"      = "icdl-north-ecr"
      "CreatedBy" = "nyasha@cloud-fundis"
  }
}

#push image manually
#aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 813260210012.dkr.ecr.eu-west-1.amazonaws.com
#docker build -t icdl-north-ecr .
#docker tag icdl-north-ecr:latest 813260210012.dkr.ecr.eu-west-1.amazonaws.com/icdl-north-ecr:latest
#docker push 813260210012.dkr.ecr.eu-west-1.amazonaws.com/icdl-north-ecr:latest