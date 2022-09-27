variable "logs_path" {
  description = "Path of the logs in CloudWatch"
}

variable "loggroup_name" {
  description = "Name of the log group in CloudWatch"
}


variable "log_group_retention_in_days" {
  description = "(Optional) Specifies the number of days you want to retain log events in the specified log group. Default to 30 days"
  type        = number
  default     = 30
}

variable "create" {
  description = "Whether to create the Cloudwatch log group"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags:map"
  type        = map(string)
  default     = {}
}

variable "kms_key_arn" {
  description = "The ARN of the KMS Key to use when encrypting log data. Please note, after the AWS KMS CMK is disassociated from the log group, AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires permissions for the CMK whenever the encrypted data is requested."
  type      = string
  default   = null
}


