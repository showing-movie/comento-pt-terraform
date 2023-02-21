variable "cluster_arn" {
  type = string
}
variable "has_task_role_custom_policy" {
  type = bool
}
variable "task_role_custom_policy" {
  type = string
}
variable "service_name" {
  type = string
}
variable "service_port" {
  type = number
}
variable "cw_retention_in_days" {
  type = number
}
variable "ecs_task_env" {
  default = []
  type = list(object({}))
}
variable "ecs_command" {
  type    = list(string)
  default = []
}
variable "ecs_cpu" {
  type = number
}
variable "ecs_mem" {
  type = number
}
variable "deployment_maximum_percent" {
  type = number
}
variable "deployment_minimum_healthy_percent" {
  type = number
}
variable "health_check_grace_period_seconds" {
  type = number
}
variable "private_subnets" {
  type = list(string)
}
#variable "service_image" {
#  type = string
#}
#variable "load_balancer" {
#  type = map(object({
#    target_group_arn = string
#  }))
#}
variable "on_demand_weight" {
  type = number
}
variable "use_fargate_spot" {
  type = bool
}
variable "on_demand_count" {
  type = number
}
variable "spot_weight" {
  type = number
}
variable "spot_count" {
  type = number
}
variable "vpc_id" {
  type = string
}
variable "load_balancer_arn" {
  type = string
}
variable "service_host" {
  type = string
}
variable "listener_port" {
  type = number
}