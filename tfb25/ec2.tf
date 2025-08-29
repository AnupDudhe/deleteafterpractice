resource "aws_instance" "this" {
   ami = var.this_image_id
   instance_type =   var.this_any.instance_type_list[0]
   vpc_security_group_ids = [var.this_map.secgroup , aws_security_group.webserversg.id , data.aws_security_group.lb_sg.id ]
   root_block_device {
    volume_size = var.this_volsize
    volume_type = var.this_list[0] 
    delete_on_termination = var.this_deleteont
}

 tags = {
     Name =  var.this_any.tags_map.name
     purpose = var.this_any.tags_map.purposeec2
   }
user_data = <<-EOF
      #!/bin/sh
      sudo -i
      yum install nginx -y
      systemctl start nginx
      systemctl enable nginx
      systemctl start mariadb
      systemctl enable mariadb
      bash /root/apache-tomcat-8.5.97/bin/catalina.sh start
      EOF


}


resource "aws_security_group" "webserversg" {
      ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
    ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}

output "this_pubip" {
  value =  aws_instance.this.public_ip

}

data "aws_security_group" "lb_sg" {
  name = "k8s-elb-ac320dc34b76c4f8ba0bb40a4896768f"  #var.vpc_security_group_ids[2]
}
et default VPC and subnets
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Security Group for ALB and EC2
resource "aws_security_group" "web_sg" {
  name   = "web-sg"
  vpc_id = data.aws_vpc.default.id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ALB
resource "aws_lb" "app_lb" {
  name               = "simple-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = data.aws_subnets.default.ids
}

resource "aws_lb_target_group" "tg" {
  name     = "simple-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# Launch Template
resource "aws_launch_template" "example" {
  name_prefix   = "simple-template-"
  image_id      = "ami-0c4fc5dcabc9df21d" # Amazon Linux 2 AMI (update as needed)
  instance_type = "t3.micro"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.web_sg.id]
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello from $(hostname)" > /var/www/html/index.html
            EOF
  )
}

# Auto Scaling Group
resource "aws_autoscaling_group" "asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = data.aws_subnets.default.ids
  target_group_arns    = [aws_lb_target_group.tg.arn]
  health_check_type    = "ELB"
  health_check_grace_period = 120

  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }
}

output "alb_dns_name" {
  value = aws_lb.app_lb.dns_name
}