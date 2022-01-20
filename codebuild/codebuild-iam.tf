resource "aws_iam_role" "CodeBuildRole" {
 
 
  name = "CodeBuildRole"

  assume_policy_role = <<EOF
  {
      "Version": "2012-10-17"
      "Statement": [
          {
              "Effect":"Allow",
              "Principal":{
                  "Service": "codebuild.amazonaws.com"
              },
              "Action": "sts:AssumeRole"
          }
      ]
  }
EOF
}

resource "aws_iam_role_policy" "CodeBuildBasePolicy-icdl-3-eu-west-1" {
   role = aws_iam_role.CodeBuildRole.name

   policy = <<POLICY
   {
       {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Resource": [
                "arn:aws:logs:eu-west-1:813260210012:log-group:icdl-codebuild-group",
                "arn:aws:logs:eu-west-1:813260210012:log-group:icdl-codebuild-group:*"
            ],
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "ssm:GetParameters*"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Resource": "*",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:GetBucketAcl",
                "s3:GetBucketLocation"
            ]
        },
        {
            "Sid": "S3AccessPolicy",
            "Effect": "Allow",
            "Action": [
                "s3:CreateBucket",
                "s3:GetObject",
                "s3:List*",
                "s3:PutObject"
            ],
            "Resource": "*"
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
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload"
            ],
            "Resource": "arn:aws:ecr:eu-west-1:813260210012:repository/icdl"
        }
    ]

POLICY
}
