variable "ec2_name" {
  type = string
}
variable "ec2_ami" {
  type = string
}
variable "ec2_type" {
  type = string
}
variable "ec2_key" {
  type = string
}
variable "ec2_sg_ids" {
  type = list(string)
}
variable "ec2_subnet" {
  type = string
}
variable "tags" {}