#blocks 
#provider , resource , variable , data , output , module , provisioner , backend 
#loops , statelocking , tf workspace. 

#provider aws (Cloud provider) => terraform  


#blockname  "blockuniquename" { #arguments}


# blockname  "cloudproviername_resourcetype" "uniquename" { #arguments}


resource  "aws_instance" "webserver" {
    ami = var.this_ami
    instance_type =  var.this_inst 
    key_name = var.this_key
    disable_api_termination =  var.this_api
    vpc_security_group_ids = [ aws_security_group.ws.id ]
    subnet_id = var.subnetid
    #count = var.this_count
}

resource "aws_security_group" "ws" {
    name = "webserver_sg"
    vpc_id = var.vpc_id
    description = "Allow HTTP and SSH traffic"


    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}



