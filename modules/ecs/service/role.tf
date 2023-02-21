resource "aws_iam_role" "ecs" {
  name               = "${var.service_name}-role"
  assume_role_policy = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "ecs.amazonaws.com"
          },
          "Effect": "Allow"
        }
      ]
    }
  EOF

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      name
    ]
  }
}

resource "aws_iam_role_policy" "ecs" {
  name = "default"
  role = aws_iam_role.ecs.id

  policy = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": [
            "ec2:AttachNetworkInterface",
            "ec2:CreateNetworkInterface",
            "ec2:CreateNetworkInterfacePermission",
            "ec2:DeleteNetworkInterface",
            "ec2:DeleteNetworkInterfacePermission",
            "ec2:Describe*",
            "ec2:DetachNetworkInterface",
            "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
            "elasticloadbalancing:DeregisterTargets",
            "elasticloadbalancing:Describe*",
            "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
            "elasticloadbalancing:RegisterTargets"
          ],
          "Effect": "Allow",
          "Resource": ["*"]
        }
      ]
    }
  EOF
}

resource "aws_iam_role" "execution" {
  name               = "${var.service_name}-exec-role"
  assume_role_policy = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "ecs-tasks.amazonaws.com"
          },
          "Effect": "Allow"
        }
      ]
    }
  EOF

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      name
    ]
  }
}

resource "aws_iam_role_policy_attachment" "execution" {
  role       = aws_iam_role.execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role" "task" {
  name               = "${var.service_name}-task-role"
  assume_role_policy = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "ecs-tasks.amazonaws.com"
          },
          "Effect": "Allow"
        }
      ]
    }
  EOF

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      name
    ]
  }
}

resource "aws_iam_role_policy" "task_ecs_task_defintion" {
  name = "ecs-task-defintion"
  role = aws_iam_role.task.id

  policy = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Resource": ["*"],
          "Action": [
            "ecs:ListTaskDefinitions"
          ]
        }
      ]
    }
  EOF
}



resource "aws_iam_role_policy" "task_custom" {
  count = var.has_task_role_custom_policy ? 1 : 0

  name   = "task-role-custom"
  role   = aws_iam_role.task.id
  policy = var.task_role_custom_policy
}
