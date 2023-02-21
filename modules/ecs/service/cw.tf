resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/ecs/${var.service_name}"
  retention_in_days = var.cw_retention_in_days
}