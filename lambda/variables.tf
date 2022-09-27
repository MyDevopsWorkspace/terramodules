variable "create_function" {
  description = "Whether to create a Lambda function"
  type        = bool
  default     = false
}

variable "payload_filename" {
  description = "Name of the file with the function code"
  default = ""
}

variable "function_name" {
  description = "Name of the Lambda function"
  default = ""
}

variable "description" {
  description = "Description of the Lambda function"
  type        = string
  default     = ""
}

variable "role_arn" {
  description = "ARN of the IAM role to dermine access to the Lambda function"
  default = ""
}

variable "lambda_function_arn" {
  description = "ARN of the  Lambda function"
  default = ""
}

variable "handler" {
  description = "The required function entrypoint"
  default = ""
}

variable "memory_size" {
  description = "Amount of memory in MB the function can use at run time"
  default     = null
}

variable "runtime" {
  description = "Identifier of the functions runtime engine"
  default = ""
}

variable "layers" {
  description = "List of Layer Version ARNs to attach to the function"
  type        = list
  default     = []
}

variable "kms_key" {
  description = "ARN for the KMS encryption key"
  default     = null
}

variable "function_variables" {
  description = "Map of environment variables for the lambda function"
  type        = map(string)
  default     = null
}

variable "create_permission" {
  description = "Whether to create a Lambda permission to attach to the function"
  type        = bool
  default     = false
}

variable "statement_id" {
  description = "SID for the lambda permission"
  default     = ""
}

variable "permission_action" {
  description = "Lambda action you want to allow in the statement"
  default     = ""
}

variable "principal" {
  description = "Principal getting the permission"
  default     = ""
}

variable "source_arn" {
  description = "ARN of the source resource with this permission"
  default     = ""
}

variable "tags" {
  description = "Map of tags applied to Lambda function"
  default     = {}
}

variable "subnet_ids" {
  description = "List of subnet IDs associated with the Lambda Function"
  default     = []
  type        = list
}

variable "security_group_ids" {
  description = "List of security group IDs associated with the lambda function"
  default     = []
  type        = list
}

variable "timeout" {
  description = "The amount of time before the lambda function times out."
  default     = "3"
}


variable "source_code_hash" {
  description = "A base64-encoded SHA256 hash of the package file, used to trigger updates"
  default     = ""
}

variable "max_event_age" {
  description = "Maximum age of a request that Lambda sends to a function for processing in seconds."
  type        = number
  default     = 60
}

variable "max_retry_attempts" {
  description = "Maximum number of times to retry when the function returns an error"
  type        = number
  default     = 2
}
