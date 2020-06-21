locals {
  tags = {
    Name        = "${var.repository_name}-${var.environment}"
    Environment = var.environment
    Terraform   = true
    Comments    = "This resource is managed by Terraform"
  }
}