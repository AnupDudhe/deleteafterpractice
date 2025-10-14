resource "aws_instance" "webserver" {
    ami =  var.webserver_ami
    instance_type = var.webserver_instance_type
    #vpc_security_group_ids = [ var.webserver_defaulsgroup , aws_security_group.sg-webserver.id , data.aws_security_group.aws_sg.id ]
    disable_api_termination = var.webserver_api_termination
    count = var.webserver_copy  #loop count.
    subnet_id = var.ec2_instance_subnet
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



resource "aws_security_group"  "sg-webserver" {
   ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }

   ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
    
   }
}



data "aws_security_group" "aws_sg" {
   name = "k8s-elb-a1c5032008df4484a803f431b42955ea"

}