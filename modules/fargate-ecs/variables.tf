variable "name" {
  default = "tg"
}

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

variable "vpc_id" {

}

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