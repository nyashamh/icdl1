resource "aws_sns_topic" "start-nat-sns" {
  name            = "start-nat-sns"
  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
}

#when creating sns, apply the topic first then push the subscription. The topic is pre requisite


resource "aws_sns_topic_subscription" "start-nat-sns-subscription" {
   topic_arn = local.start-nat-sns-arn
   #display_name = "Created_NAT_gateways_in_CPT_and_Ireland"
   protocol = "email"
   endpoint = "nyasha@cloud-fundis.co.za"

}

resource "aws_sns_topic_policy" "default" {
  count  = 1
  arn    = aws_sns_topic.start-nat-sns.arn
  policy = "${data.aws_iam_policy_document.start_nat_sns_topic_policy.0.json}"
}

data "aws_caller_identity" "current" {}
data "aws_iam_policy_document" "start_nat_sns_topic_policy" {
  count = "1"


  statement {
    sid    = "__default_statement_ID"
    effect = "Allow"

    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"
      values   = ["${data.aws_caller_identity.current.account_id}"]
    }

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = ["${aws_sns_topic.start-nat-sns.arn}"]
  }


  statement {
    sid       = "Allow CloudwatchEvents"
    actions   = ["SNS:Publish"]
    resources = [aws_sns_topic.start-nat-sns.arn]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }
  
}


##################################################

/*


data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "sns-start-topic-policy" {
  policy_id = "__default_policy_ID"

  statement {
    sid    = "__default_statement_ID"
    effect = "Allow"

    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"
      values   = ["${data.aws_caller_identity.current.account_id}"]
    
    }

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = local.start-nat-sns_arn
    #resources = ["${aws_sns_topic.autoscaling_events.arn}"]
  }

  statement {
    sid     = "AWSEvents_capture-autoscaling-events_SendToSNS"
    effect  = "Allow"
    actions = ["SNS:Publish"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = local.start-nat-sns_arn
    #resources = ["${aws_sns_topic.autoscaling_events.arn}"]
  }
}

resource "aws_sns_topic_policy" "cw_event_permissions" {
  arn = local.start-nat-sns-arns
  policy = "${data.aws_iam_policy_document.start_nat_sns_topic_policy.json}"
  # policy = "${data.aws_iam_policy_document.sns-topic-policy.json}"
}

resource "aws_cloudwatch_event_rule" "cw_event_to_sns-start" {
  name          = "capture-autoscaling-events"
  description   = "Capture autoscaling evetns"
  event_pattern = "${file("files/cloudwatch-rule.json")}"
}
*/