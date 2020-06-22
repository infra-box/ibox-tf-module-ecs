locals {
  tags = {
    Name        = "${var.name}-tg-${var.environment}"
    Environment = var.environment
    Terraform   = true
  }
}