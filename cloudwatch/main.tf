resource "aws_cloudwatch_log_group" "this" {
  count = var.create ? 1 : 0
 name              = "${var.logs_path}${var.loggroup_name}"
  retention_in_days = var.log_group_retention_in_days
  tags = merge(
    {
      "Name" = format("%s%s", var.logs_path,var.loggroup_name)
    },
    var.tags
  )
  kms_key_id        = var.kms_key_arn
}

