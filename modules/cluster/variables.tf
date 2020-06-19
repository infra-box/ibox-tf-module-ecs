variable "cluster_name" {}
variable "environment" {}
variable "replication_profile" {
  default = null
}
variable "provider_profile" {
  default = "default"
}
variable "replication" {
  default = false
}
variable "replica_region" {
  default = "eu-west-1"
}
variable "tags" {
  default = {}
}
variable "replication_tags" {
  default = {}
}