terraform {
  backend "s3" {
    bucket  = "tfstate.park.com"
    key     = "alpha/ecs/comento-pt/terraform.state"
    region  = "ap-northeast-2"
    profile = "park"
  }
}
