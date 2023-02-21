resource "aws_ecs_service" "this" {
  name                               = var.service_name
  cluster                            = var.cluster_arn
  task_definition                    = aws_ecs_task_definition.this.arn

  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  health_check_grace_period_seconds  = var.health_check_grace_period_seconds
  network_configuration {
    subnets         = var.private_subnets
    security_groups = [aws_security_group.allow_ecs_service.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.this.arn
    container_name   = var.service_name
    container_port   = var.service_port
  }
  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = var.on_demand_weight
    base              = var.on_demand_count
  }

  capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
    weight            = var.spot_weight
    base              = var.spot_count
  }

  lifecycle {
    ignore_changes = [
      desired_count,
      task_definition
    ]
  }
}
