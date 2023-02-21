resource "aws_security_group" "allow_ecs_service" {
  name        = "allow ecs_service"
  description = "allow ecs_service"
  vpc_id      = var.vpc_id

  ingress {
    description = "service"
    from_port   = var.service_port
    to_port     = var.service_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
