module "ecs_cluster" {
  source = "../../modules/cluster"

  provider_profile = ""
  cluster_name = "test"
  environment = "dev"
}
