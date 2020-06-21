locals {
  tags = {
    Name        = "${var.service}-${var.environment}"
    Environment = var.environment
    Terraform   = true
    Comments    = "This resource is managed by Terraform"
  }
}
provider "aws" {
  alias   = "replica"
  profile = var.profile
  region  = var.aws_region_replica
}

resource "aws_ecr_repository" "default" {
  name = "${var.service}-ecr-${var.environment}"
  tags = merge(var.tags, local.tags)
}


resource "aws_ecr_repository_policy" "default" {
  count      = var.enable_repository_policy ? 1 : 0
  repository = aws_ecr_repository.default.name
  policy     = var.ecr_policy
}

// Replication resources

resource "aws_ecr_repository" "default_replica" {
  provider = aws.replica
  count    = var.ecr_replica ? 1 : 0
  name     = "${var.service}-ecr-${var.environment}"
  tags     = merge(var.tags, local.tags, { Name = "replica-${local.tags.Name}" })
}
resource "aws_ecr_repository_policy" "default_replica" {
  provider   = aws.replica
  count      = var.enable_repository_policy && var.ecr_replica ? 1 : 0
  repository = aws_ecr_repository.default_replica[0].name
  policy     = var.ecr_policy
}