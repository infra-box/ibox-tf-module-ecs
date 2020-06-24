resource "aws_security_group" "service" {
  name        = "${var.service}-sg"
  description = "Allow ${var.port} inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "${var.port} from VPC"
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.ingress_traffic_from_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.service}-sg"
  }
}

resource "aws_ecs_service" "default" {
  name                              = var.service
  cluster                           = var.cluster_id
  task_definition                   = aws_ecs_task_definition.default.arn
  desired_count                     = var.app_count
  launch_type                       = "FARGATE"
  health_check_grace_period_seconds = var.health_check_period

  network_configuration {
    security_groups = [aws_security_group.service.id]
    subnets         = var.private_subnets_ids
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.tg.arn
    container_name   = "${var.service}-${var.environment}"
    container_port   = var.port
  }

  # To prevent a race condition during service deletion, make sure to set depends_on to the related aws_iam_role_policy;
  # otherwise, the policy may be destroyed too soon and the ECS service will then get stuck in the DRAINING state.
  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      task_definition
    ]
  }

  dynamic "service_registries" {
    for_each = var.with_service_discovery == true ? [1] : []
    content {
      registry_arn = aws_service_discovery_service.this.arn
    }
  }

  depends_on = [aws_iam_role_policy.ecs_task_execution_role_policy, var.dependencies]
}