module "alb" {
  source         = "../../../../modules/alb"
  alb_name       = "comento-pt-public"
  vpc_id         = data.terraform_remote_state.vpc.outputs.vpc_id
  public_subnets = data.terraform_remote_state.vpc.outputs.public_subnets
}