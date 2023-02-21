locals {
  remote_state_config = {
    bucket  = "tfstate.park.com"
    region  = "ap-northeast-2"
    profile = "park"
  }
  service_name = "nestjs"
}
