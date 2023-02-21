variable "vpc_id" {
  type = string
}

variable "alb_name" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}