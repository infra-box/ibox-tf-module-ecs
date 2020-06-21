resource "aws_ecs_cluster" "default" {
  name = "${var.cluster_name}-cluster-${var.environment}"

  tags = merge(local.tags,var.tags)
}