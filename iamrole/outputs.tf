output "iam_role_arn" {
  value       = aws_iam_role.default.arn
  description = "The Amazon Resource Name (ARN) specifying the role."
}

output "iam_role_create_date" {
  value       = aws_iam_role.default.create_date
  description = "The creation date of the IAM role."
}

output "iam_role_unique_id" {
  value       = aws_iam_role.default.unique_id
  description = "The stable and unique string identifying the role."
}

output "iam_role_name" {
  value       = aws_iam_role.default.name
  description = "The name of the role."
}

output "iam_role_description" {
  value       = aws_iam_role.default.description
  description = "The description of the role."
}

output "iam_policy_id" {
  value = element(concat(aws_iam_policy.default.*.id, [""]), 0)
}

output "iam_policy_arn" {
  value = element(concat(aws_iam_policy.default.*.arn, [""]), 0)
}

output "iam_policy_description" {
  value = element(concat(aws_iam_policy.default.*.description, [""]), 0)
}

output "iam_policy_name" {
  value = element(concat(aws_iam_policy.default.*.name, [""]), 0)
}

output "iam_policy_path" {
  value = element(concat(aws_iam_policy.default.*.description, [""]), 0)
}

output "iam_policy_document" {
  value = element(concat(aws_iam_policy.default.*.name, [""]), 0)
}

output "iam_instance_profile_id" {
  value = var.create_instance_profile ? aws_iam_instance_profile.default[0].id : null
}

output "iam_instance_profile_arn" {
  value = var.create_instance_profile ? aws_iam_instance_profile.default[0].arn : null
}

output "iam_instance_profile_name" {
  value = var.create_instance_profile ? aws_iam_instance_profile.default[0].name : null
}
