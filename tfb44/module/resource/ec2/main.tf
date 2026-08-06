resource "aws_instance"  "webserver" {
    ami = var.amiid
    instance_type = var.insttype
    vpc_security_group_ids =  [ var.sg ]
    key_name = var.kp
    subnet_id = var.ws_subnet
    tags = {
        purpose = "webserver"
    }
    disable_api_termination = var.apiterm
    user_data = <<-EOF
                 #!/bin/bash
                 sudo yum install nginx -y
                 sudo systemctl start nginx
                EOF

}