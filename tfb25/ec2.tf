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
