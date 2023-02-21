module "ecr_repository" {
  source       = "../../ecr"
  service_name = var.service_name
}
