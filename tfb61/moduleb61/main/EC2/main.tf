resource "aws_instance" "webserver" {
   ami = var.webserver_ami
   instance_type  = var.webserver_instance_type
   key_name = var.webserver_key_name
   subnet_id = var.webserver_subnetA
   vpc_security_group_ids = [ var.webserver_sg ]
   disable_api_termination = var.webserver_disable_api_termination
   #count = var.webserver_count
   user_data = <<-EOF
               #!/bin/bash
               sudo yum update -y
               sudo yum install -y httpd
               sudo systemctl start httpd
               sudo systemctl enable httpd
               echo "<h1>Welcome to Webserver</h1>" > /var/www/html/index.html
               EOF

}



