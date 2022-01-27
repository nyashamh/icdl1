data "archive_file" "zip" {
    type = "zip"
    source_file = "${path.module}/nat-lambda-function.py"
    output_path = "${path.module}/nat-lambda-function.zip"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

