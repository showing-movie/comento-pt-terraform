module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = var.ec2_name

  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  key_name               = var.ec2_key
  monitoring             = true
  vpc_security_group_ids = var.ec2_sg_ids
  subnet_id              = var.ec2_subnet

  tags = var.tags
}