locals { #Needs to be set as terraform can't loop over [null] in dynamic block. Need to explicitly set empty list if no functional variables are set
  environment_map = var.function_variables == null ? [] : [var.function_variables]
}

resource "aws_lambda_function" "this" {
  #depends_on       = [var.depends_on_list]
  filename         = var.payload_filename
  function_name    = var.function_name
  description      = var.description
  role             = var.role_arn
  handler          = var.handler
  memory_size      = var.memory_size
  runtime          = var.runtime
  layers           = var.layers
  kms_key_arn      = var.kms_key
  timeout          = var.timeout
  source_code_hash = var.source_code_hash

  dynamic "environment" {
    for_each = local.environment_map

    content {
      variables = environment.value
    }
  }

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  tags = var.tags
}

resource "aws_lambda_permission" "this" {
  count         = var.create_permission ? 1 : 0
  #depends_on    = [var.depends_on_list]
  statement_id  = var.statement_id
  action        = var.permission_action
  function_name = var.lambda_function_arn
  principal     = var.principal
  source_arn    = var.source_arn
}

resource "aws_lambda_function_event_invoke_config" "this" {
  function_name                = aws_lambda_function.this.function_name
  maximum_event_age_in_seconds = var.max_event_age
  maximum_retry_attempts       = var.max_retry_attempts
}



