output "this_sns_topic_arn" {
  description = "ARN of SNS topic"
  value       = element(concat(aws_sns_topic.this.*.arn, [""]), 0)
}

output "this_sns_subscription_arn" {
  description = "ARN of SNS subscription"
  value       = element(concat(aws_sns_topic_subscription.this.*.arn, [""]), 0)
}