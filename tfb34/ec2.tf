#blocks 
#provider , resource , variable , data , output , module , provisioner , backend 
#loops , statelocking , tf workspace. 

#provider aws (Cloud provider) => terraform  


#blockname  "blockuniquename" { #arguments}

provider "aws" {
    secret_key = "" 
    access_key = ""
    region = "us-east-1"

}

# blockname  "cloudproviername_resourcetype" "uniquename" { #arguments}


resource  "aws_instance" "webserver" {
    ami = var.this_ami
    instance_type =  var.this_inst 
    key_name = var.this_key
    disable_api_termination =  var.this_api
    vpc_security_group_ids = [var.this_sg]
    count = var.this_count
}