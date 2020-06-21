variable "service" {}
variable "environment" {}
variable "aws_region_replica" {
  default = "eu-west-1"
}

variable "profile" {
  default = "shared-services"
}

variable "ecr_replica" {
  default = true
}
variable "ecr_policy" {
  default = null
  #if variable enable_repository_policy is enabled(it is by default) you must add the policy when creating the repository
}
variable "enable_repository_policy" {
  default = false
}
variable "tags" {
  default = {}
}