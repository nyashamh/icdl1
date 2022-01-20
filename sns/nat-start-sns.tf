resource "aws_sns_topic_subscription" "start-nat-sns" {
   topic_arn = aws_sns_topic.start-nat-sns.arn
   #display_name = "Created_NAT_gateways_in_CPT_and_Ireland"
   protocol = "email-json"
   endpoint = "nyasha@cloud-fundis.co.za"
   #topic = "start-nat-sns"
}

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