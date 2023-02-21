module "cluster" {
  source = "terraform-aws-modules/ecs/aws"

  cluster_name = var.cluster_name

  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        base   = 1
        weight = 0
      }
    }
    FARGATE_SPOT = {
      default_capacity_provider_strategy = {
        base   = 0
        weight = 1
      }
    }
  }

  tags = {
    Environment = "Development"
  }
}
