SNS

Used to create SNS Topics and subscriptions.

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.63 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_sns_topic) | resource |
| [aws_sns_topic_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_sns_topic_subscription) | resource |


To create subscriptions pass through a list for the subscription parameter under the following structure:

```
subscriptions = [
	{
		protocol = "sqs"
		endpoint = "arn:aws:sqs:eu-west-2:xxxxxxxxxxxxx:sqs-endpoint"
		raw_message_delivery = false
	},
	{
		...
	}
]
```
