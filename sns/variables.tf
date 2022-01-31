variable "sns_start_name" {
        description = "Name of the SNS Topic to be created"
        default = "Created_Nat_Gateways"
}

variable "sns_shutdown_name" {
        description = "Name of the SNS Topic to be created"
        default = "Shutdown_NAt_gateways"
}

variable "account_id" {
        description = "My Accout Number"
        default = "813260210012"
}

variable "sns_topic_name" {
  type = string
  description = "sns topic name"
  default = "my-topic"
}

variable "sns_subscription_email_address_list" {
  type = string
  description = "List of email addresses as string(space separated)"
  default = "nyasha@cloud-fundis.co.za"
}