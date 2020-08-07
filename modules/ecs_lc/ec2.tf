resource "aws_launch_configuration" "main" {
  name_prefix = var.name_preffix

  iam_instance_profile = aws_iam_instance_profile.ecs_instance_profile.name

  instance_type               = var.instance_type
  image_id                    = var.image_id
  associate_public_ip_address = false
  security_groups             = concat(var.security_group_ids, [aws_security_group.main.id])

  root_block_device {
    volume_type = "standard"
  }

  ebs_block_device {
    device_name = "/dev/xvdcz"
    volume_type = "standard"
    encrypted   = true

    volume_size = 20
  }

  user_data = <<EOF
#!/bin/bash

echo 'ECS_CLUSTER=${var.name_preffix}' >> /etc/ecs/ecs.config
echo 'ECS_DISABLE_PRIVILEGED=true' >> /etc/ecs/ecs.config
EOF


  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "main" {
  name = "${var.name_preffix}-asg"

  launch_configuration = aws_launch_configuration.main.id
  termination_policies = ["OldestLaunchConfiguration", "Default"]
  vpc_zone_identifier  = var.subnet_ids

  desired_capacity = var.desired_capacity
  max_size         = var.enable_autoscaling ? var.max_size : var.desired_capacity
  min_size         = var.enable_autoscaling ? var.min_size : var.desired_capacity

  lifecycle {
    create_before_destroy = true
  }
}
