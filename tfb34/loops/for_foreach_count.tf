provider "aws" {
    profile = "configs"  #masking 
    region = "us-east-1"

} 

#for repitative resource creation we can use count
resource  "aws_instance" "webserver" {
    ami = var.this_ami
    instance_type =  var.this_inst 
    key_name = var.this_key
    disable_api_termination =  var.this_api
    vpc_security_group_ids = [var.this_sg ]
    count = 2
}

#for unique resource creation we can use for_each 
resource "aws_instance" "webserver2" {
    for_each = toset(var.ami)
    ami =  each.value  #ubuntu #amazon linux #windows 
    instance_type =  var.this_inst 
    key_name = var.this_key
    disable_api_termination =  var.this_api
    vpc_security_group_ids = [var.this_sg ]

}

variable "ami" {
                #ubuntu #amazon linux #windows
    default = ["ami-0ec10929233384c7f" , "ami-0ea87431b78a82070" , "ami-01a15dfc48279bf55"]
  
}

output "aws_ec2" {
    value = [
        for ami_id in var.ami:
            aws_instance.webserver2[ami_id].public_ip
    ]
}