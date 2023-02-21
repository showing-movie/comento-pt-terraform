terraform {
  backend "s3" {
    bucket  = "tfstate.park.com"
    key     = "alpha/vpc/terraform.state"
    region  = "ap-northeast-2"
    profile = "park"
  }
}
