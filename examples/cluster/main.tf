provider "aws" {
  region = "us-east-1"
  profile = "maando-shared"
}

module "ecs_cluster" {
  source = "../../modules/cluster"

  cluster_name = "test"
  environment = "dev"
}
