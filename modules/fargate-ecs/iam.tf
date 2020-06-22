resource "aws_iam_role" "ecs_task_execution_access_role" {
  name                  = "${var.service}-task-exec-role-${var.environment}"
  assume_role_policy    = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  path                  = "/"
  force_detach_policies = true
}
resource "aws_iam_role_policy" "ecs_task_execution_role_policy" {
  name = "${var.service}-role-policy-${var.environment}"
  role = aws_iam_role.ecs_task_execution_access_role.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
        "Sid": "VisualEditor1",
        "Effect": "Allow",
        "Action": "ecr:*",
        "Resource": "arn:aws:ecr:*:*:repository/*"
    },
    {
      "Sid": "ParameterStoreGetValue",
      "Effect": "Allow",
      "Action": [
        "ssm:GetParameters",
        "secretsmanager:GetSecretValue",
        "kms:Decrypt"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "service_task_role" {
  name = "${var.service}-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "service-business-capability-access-policy" {
  name = "${var.service}-access-policy"
  role = aws_iam_role.service_task_role.id
  policy = var.service_policy
}