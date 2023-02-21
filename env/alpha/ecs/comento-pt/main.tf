module "cluster" {
  source             = "../../../../modules/ecs/cluster"
  cluster_name       = "comento-pt"
  container_insights = false
}

module "api" {
  source                             = "../../../../modules/ecs/service"
  cluster_arn                        = module.cluster.arn
  private_subnets                    = data.terraform_remote_state.vpc.outputs.private_subnets
  cw_retention_in_days               = 1
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  health_check_grace_period_seconds  = 0
  ecs_cpu                            = 256
  ecs_mem                            = 512
  use_fargate_spot                   = true
  on_demand_count                    = 1
  on_demand_weight                   = 0
  spot_count                         = 0
  spot_weight                        = 1
  service_name                       = local.service_name
  service_port                       = 3000
  listener_port                      = 80
  has_task_role_custom_policy        = false
  task_role_custom_policy            = ""
  load_balancer_arn                  = data.terraform_remote_state.alb.outputs.alb_arn
  service_host                       = "*"
  vpc_id                             = data.terraform_remote_state.vpc.outputs.vpc_id
}