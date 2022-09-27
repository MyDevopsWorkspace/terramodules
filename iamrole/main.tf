# Terraform module which creates IAM Role and IAM Policy resources on AWS.
#
# https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html

# https://www.terraform.io/docs/providers/aws/r/iam_role.html
resource "aws_iam_role" "default" {
  name               = var.name
  assume_role_policy = var.assume_role_policy

  path        = var.path
  description = var.description

  max_session_duration  = var.max_session_duration
  force_detach_policies = var.force_detach_policies
  tags                  = var.tags
}

# https://www.terraform.io/docs/providers/aws/r/iam_policy.html
resource "aws_iam_policy" "default" {
  count  = var.policy == "" ? 0 : 1
  name   = var.name
  policy = var.policy

  path        = var.path
  description = var.description
  tags        = var.tags
}

# https://www.terraform.io/docs/providers/aws/r/iam_role_policy_attachment.html
resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.name
  policy_arn = var.policy == "" ? var.policy_arn : aws_iam_policy.default[0].arn
}

# https://www.terraform.io/docs/providers/aws/r/iam_instance_profile.html
resource "aws_iam_instance_profile" "default" {
  count = var.create_instance_profile ? 1 : 0

  name = var.name
  role = aws_iam_role.default.name
  tags = var.tags
}
