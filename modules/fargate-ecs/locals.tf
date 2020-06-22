locals {
  image = var.ecr_url != null ? "${var.ecr_url}:${var.image_tag}" : var.image
  secrets                   = var.secrets
  env_variables             = var.env_variables
  secrets_json_map          = jsonencode(local.secrets)
  env_variables_map         = jsonencode(local.env_variables)
  tags = {
    Name        = "${var.service}-tg-${var.environment}"
    Environment = var.environment
    Terraform   = true
  }
}