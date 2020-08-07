resource "aws_lb" "public" {
  count = var.enable_public_lb ? 1 : 0

  name = "${var.name_preffix}-public-lb"

  load_balancer_type = "application"

  internal = false
  subnets  = module.network.public_subnets_ids

  enable_deletion_protection = false
}
