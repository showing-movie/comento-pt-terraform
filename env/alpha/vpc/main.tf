module "vpc" {
  source          = "../../../modules/vpc"
  private_subnets = ["10.101.2.0/24", "10.101.3.0/24"]
  public_subnets  = ["10.101.0.0/24", "10.101.1.0/24"]
  vpc_azs         = ["ap-northeast-2a", "ap-northeast-2c"]
  vpc_cidr        = "10.101.0.0/16"
  vpc_name        = "tftest-pt-tf"
  tags = {
    Terraform = "true"
  }
}