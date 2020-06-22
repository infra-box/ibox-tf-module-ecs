resource "aws_cloudwatch_log_group" "default" {
  name              = "${var.service}-log-group"
  retention_in_days = 60

  tags = {
    Name        = "${var.service}-${var.environment}"
    Environment = var.environment
    Terraform   = true
    Comments    = "This resource is managed by Terraform"
  }
}

resource "aws_ecs_task_definition" "default" {
  family                   = var.service
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  execution_role_arn       = aws_iam_role.ecs_task_execution_access_role.arn
  task_role_arn            = aws_iam_role.service_task_role.arn
  container_definitions    = <<DEFINITION
[
  {
    "cpu": ${var.fargate_cpu},
    "image": "${local.image}",
    "memory": ${var.fargate_memory},
    "name": "${var.service}-${var.environment}",
    "memoryReservation": ${var.memory_reservation},
    "networkMode": "awsvpc",
    "LogConfiguration": {
      "LogDriver": "awslogs",
      "Options": {
        "awslogs-region": "${var.aws_region}",
        "awslogs-group": "${aws_cloudwatch_log_group.default.id}",
        "awslogs-stream-prefix": "${var.environment}"
      }
    },
    "portMappings": [
      {
        "containerPort": ${var.port},
        "hostPort": ${var.port}
      }
    ],
    "secrets": ${local.secrets_json_map},
    "environment": ${local.env_variables_map}
  }
]
DEFINITION
  tags = {
    Name        = "${var.service}-${var.environment}"
    Environment = var.environment
    Terraform   = true
    Comments    = "This resource is managed by Terraform"
  }
}