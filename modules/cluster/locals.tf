locals {
  tags = {
    Name = "${var.cluster_name}-${var.environment}"
    Environment = var.environment
    Terraform = true
  }
}