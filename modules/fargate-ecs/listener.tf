resource "aws_alb_listener" "listener" {
  load_balancer_arn = var.load_balancer.this_lb_arn
  port              = var.port
  protocol          = var.protocol
  /*
    ssl_policy = var.ssl_policy
    certificate_arn = var.certificate_arn
  */

  default_action {
    type             = var.default_action
    target_group_arn = aws_lb_target_group.tg.arn
  }
}