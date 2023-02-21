locals {
  service_container_definition = jsonencode({
    name  = var.service_name
    image = "${module.ecr_repository.repository_url}:latest"
    cpu   = 0
    portMappings = var.service_port != null ? [{
      hostPort      = var.service_port
      protocol      = "tcp"
      containerPort = var.service_port
    }] : []
    ulimits = [{
      name      = "nofile"
      softLimit = 65535
      hardLimit = 65535
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = aws_cloudwatch_log_group.this.name
        "awslogs-region"        = "ap-northeast-2"
        "awslogs-stream-prefix" = "ecs"
      }
      secretOptions = []
    }
    environment           = var.ecs_task_env
    dockerLabels          = {}
    essential             = true
    command               = var.ecs_command
    dnsSearchDomains      = []
    dnsServers            = []
    dockerSecurityOptions = []
    entryPoint            = []
    extraHosts            = []
    links                 = []
    mountPoints           = []
    secrets               = []
    systemControls        = []
    volumesFrom           = []
  })
}

resource "aws_ecs_task_definition" "this" {
  family                   = "alpha-${var.service_name}"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.ecs_cpu
  memory                   = var.ecs_mem
  container_definitions    = format("[%s]", local.service_container_definition)

  execution_role_arn       = aws_iam_role.execution.arn
  task_role_arn            = aws_iam_role.task.arn
}