resource "aws_lb_target_group" "tg" {

  name = "${var.name}-tg-${var.environment}"

  port        = var.port
  protocol    = var.protocol
  vpc_id      = var.vpc_id
  target_type = var.type

  dynamic "stickiness" {
    for_each = var.protocol == "HTTP" ? [1] : []
    content {
      type            = "lb_cookie"
      cookie_duration = var.cookie_duration
      enabled         = var.cookie_enabled
    }
  }

  dynamic "health_check" {
    for_each = var.protocol == "HTTP" ? [1] : []
    content {
      enabled             = var.health_check
      interval            = var.health_check_interval
      port                = var.health_check_port
      timeout             = var.health_check_timeout
      healthy_threshold   = var.health_check_healthy_threshold
      unhealthy_threshold = var.health_check_unhealthy_threshold

      path    = var.health_check_path
      matcher = var.health_check_matcher

      protocol = var.health_check_protocol
    }
  }

  tags = merge(local.tags, var.tags)

  depends_on = [var.load_balancer]

}