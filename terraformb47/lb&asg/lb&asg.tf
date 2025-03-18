resource "aws_lb" "test" {
  name               = var.this_name
  internal           = var.internal["key"]
  load_balancer_type = var.this_lbtype[0]
  security_groups    = [var.this_sg]
  enable_deletion_protection = var.this_dp 	
  subnets            = ["subnet-0ff38141a792616f5" , "subnet-042374d63a6989a76"] 

} 

output "lb_output" {

     description = "dns of lb"
     value       = aws_lb.test.dns_name
}