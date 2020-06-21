provider "aws" {
  region = "us-east-1"
}
module "ecs_registry" {
  source = "../../modules/registry"

  environment = "dev"
  repository_name = "testing"
}