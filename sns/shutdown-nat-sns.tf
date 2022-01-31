resource "aws_sns_topic" "shutdown-nat-sns" {
  name            = "shutdown-nat-sns"
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

resource "aws_sns_topic_subscription" "shutdown-nat-sns-subscription" {
   topic_arn = local.shutdown-nat-sns-arn
   #display_name = "Shutdown_NAT_gateways_in_CPT_and_Ireland"
   protocol = "email"
   endpoint = "nyasha@cloud-fundis.co.za"

}

resource "aws_sns_topic_policy" "default1" {
  count  = 1
  arn    = aws_sns_topic.shutdown-nat-sns.arn
  policy = "${data.aws_iam_policy_document.shutdown_nat_sns_topic_policy.0.json}"
}

data "aws_iam_policy_document" "shutdown_nat_sns_topic_policy" {
  count = "1"
  statement {
    sid       = "Allow CloudwatchEvents"
    actions   = ["sns:Publish"]
    resources = [aws_sns_topic.shutdown-nat-sns.arn]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }
}