resource "aws_security_group" "main" {
  name        = "${var.name_preffix}-sg"

  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "main" {
  description       = "All outbound"
  security_group_id = aws_security_group.main.id

  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
