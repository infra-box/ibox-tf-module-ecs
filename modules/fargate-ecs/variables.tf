variable "environment" {}
variable "prefix" {
  default = "tg-"
}
variable "stickiness" {
  default = true
}
variable "port" {
  default = 80
}
variable "protocol" {
  default = "TCP"
}
variable "vpc_id" {}
variable "type" {
  default = "ip"
}
variable "cookie_duration" {
  default = 300
}
variable "cookie_enabled" {
  default = true
}
variable "health_check" {
  default = true
}
variable "health_check_interval" {
  default = 30
}
variable "health_check_path" {
  default = "/actuator/healthcheck"
}
variable "health_check_port" {
  default = 80
}
variable "health_check_protocol" {
  default = "HTTP"
}
variable "health_check_timeout" {
  default = 20
}
variable "health_check_healthy_threshold" {
  default = 3
}
variable "health_check_unhealthy_threshold" {
  default = 3
}
variable "health_check_matcher" {
  default = 200
}
variable "load_balancer" {}
variable "tags" {
  default = {}
}

###########################################################
# TCP, TLS, UDP, TCP_UDP, HTTP and HTTPS. Defaults to HTTP
variable "listener_protocol" {
  default = "HTTP"
}
variable "ssl_policy" {
  default = null
}
variable "certificate_arn" {
  default = null
}
variable "default_action" {
  default = "forward"
}

###########################################################
variable "service" {}
variable "app_count" {
  description = "Number of docker containers to run"
  default     = 2
}
variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}
variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}
variable "memory_reservation" {
  description = "fargate soft limit (MIB)"
  default     = "1000"
}
variable "service_policy" {
  default = null
}
variable "ecr_url" {
  default = null
}
variable "aws_region" {}
variable "env_variables" {
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "secrets" {
  type = list(object({
    name      = string
    valueFrom = string
  }))
  default = []
}
variable "image" {
  default = null
}
variable "image_tag" {
  default = null
}
