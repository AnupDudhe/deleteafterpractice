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

resource "aws_launch_template" "foobar" {
  name_prefix   = "foobar"
  image_id      = "ami-05c179eced2eb9b5b"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["ap-south-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}