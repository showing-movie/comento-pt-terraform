data "terraform_remote_state" "alb" {
  backend = "s3"
  config  = merge(local.remote_state_config, tomap({ "key" = "alpha/alb/comento-pt/terraform.state" }))
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config  = merge(local.remote_state_config, tomap({ "key" = "alpha/vpc/terraform.state" }))
}