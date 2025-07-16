resource "aws_instance" "this" {
   ami = var.this_image_id
   instance_type =   var.instance_type_list
   vpc_security_group_ids = [aws_security_group.webserversg.id ]
   subnet_id = var.this_aws_instance_subnet 
   root_block_device {
    volume_size = var.this_volsize
    volume_type = var.this_voltype
    delete_on_termination = var.this_deleteont

}

 tags = {
     Name =  var.this_name
     purpose = var.this_purposeec2
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



data "aws_security_group" "lb_sg" {
  name = "k8s-elb-ac320dc34b76c4f8ba0bb40a4896768f"  #var.vpc_security_group_ids[2]
}