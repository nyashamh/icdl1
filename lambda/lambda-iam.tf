resource "aws_iam_role" "icdl-nat-lambda-role" {
  name = "icdl-nat-lambda-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "nat-lambda-logging" {
  name        = "nat-lambda-logging"
  path        = "/"
  description = "IAM policy for lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",      
      "Effect": "Allow"
    },

        {
            "Effect": "Allow",
            "Action": "logs:CreateLogGroup",
            "Resource": "arn:aws:logs:eu-west-1:813260210012:*"
        },
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:codebuild:eu-west-1:813260210012:project/icdl-codebuild"
        },
        {
            "Effect": "Allow",
            "Action": [
                "codebuild:CreateProject",
                "codebuild:StartBuild",
                "codebuild:StopBuild",
                "codebuild:ListProjects"
            ],
            "Resource": "arn:aws:codebuild:eu-west-1:813260210012:report-group/icdl-codebuild-*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "codebuild:CreateReportGroup",
                "codebuild:CreateReport",
                "codebuild:UpdateReport",
                "codebuild:BatchPutTestCases",
                "codebuild:BatchPutCodeCoverages"
            ],
            "Resource": [
                "arn:aws:codebuild:eu-west-1:813260210012:report-group/icdl-codebuild-*"
            ]
        },

        {
            "Sid": "SpecificTable",
            "Effect": "Allow",
            "Action": [
                "dynamodb:BatchGet*",
                "dynamodb:DescribeStream",
                "dynamodb:DescribeTable",
                "dynamodb:Get*",
                "dynamodb:Query",
                "dynamodb:Scan",
                "dynamodb:BatchWrite*",
                "dynamodb:CreateTable",
                "dynamodb:Delete*",
                "dynamodb:Update*",
                "dynamodb:PutItem"
            ],
            "Resource": "arn:aws:dynamodb:eu-west-1:813260210012:table/icdl-north-sstate-table"
        },
        {
            "Effect": "Allow",
            "Action": [
                "lambda:AddPermission",
                "lambda:RemovePermission",
                "lambda:CreateAlias",
                "lambda:UpdateAlias",
                "lambda:DeleteAlias",
                "lambda:UpdateFunctionCode",
                "lambda:UpdateFunctionConfiguration",
                "lambda:PutFunctionConcurrency",
                "lambda:DeleteFunctionConcurrency",
                "lambda:PublishVersion",
                "lambda:GetFunction"
            ],
            "Resource": "arn:aws:iam::813260210012:role/service-role/codebuild-icdl-codebuild-service-role"
        },
        {
            "Effect": "Allow",
            "Action": [
                "codebuild:CreateProject",
                "codebuild:StartBuild",
                "codebuild:StopBuild",
                "codebuild:ListProjects"
            ],
            "Resource": "*"
        }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "icdl-lambda-logs" {
  role       = aws_iam_role.icdl-nat-lambda-role.name
  policy_arn = aws_iam_policy.nat-lambda-logging.arn
}
