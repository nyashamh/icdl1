resource "aws_sns_topic_subscription" "shutdown-nat-sns" {
   topic_arn = aws_sns_topic.shutdown-nat-sns.arn
   display_name = "Shutdown_NAT_gateways_in_CPT_and_Ireland"
   protocol = "Email"
   endpoint = "nyasha@cloud-fundis.co.za"
   topic = "shutdown-nat-sns"
}

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