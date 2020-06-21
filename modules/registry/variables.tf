variable "repository_name" {}
variable "environment" {}
variable "provider_profile" {
  default = "default"
}
variable "tags" {
  default = {}
}
variable "enable_repository_policy" {
  default = false
}
variable "repository_policy" {
  default = null
}
variable "replication_tags" {
  default = {}
}