provider "aws" {
  profile = var.provider_profile
  region  = var.replica_region
}
resource "aws_ecs_cluster" "default" {
  name = "${var.cluster_name}-cluster-${var.environment}"

  tags = merge(local.tags,var.tags)
}

############### replication
provider "aws" {
  profile = var.replication ? var.replication_profile : var.provider_profile
  region  = var.replica_region
  alias   = "replication"
}

resource "aws_ecs_cluster" "default_replica" {
  provider = aws.replication
  count    = var.replication ? 1 : 0
  name     = "${var.cluster_name}-cluster-${var.environment}"

  tags = merge(local.tags,var.replication_tags)
}