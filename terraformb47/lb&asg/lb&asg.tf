resource "aws_lb" "test" {
  name               = var.this_name
  internal           = var.internal["key"]
  load_balancer_type = var.this_lbtype[0]
  security_groups    = [var.this_sg]
  enable_deletion_protection = var.this_dp

}