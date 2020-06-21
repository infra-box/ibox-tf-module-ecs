resource "aws_ecr_repository" "this" {
  name = "${var.repository_name}-ecr-${var.environment}"
  tags = merge(var.tags, local.tags)
}

resource "aws_ecr_repository_policy" "this" {
  count      = var.enable_repository_policy ? 1 : 0
  repository = aws_ecr_repository.this.name
  policy     = var.repository_policy
}