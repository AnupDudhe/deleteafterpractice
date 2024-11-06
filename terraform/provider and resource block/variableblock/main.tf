resource "aws_instance" "this_ubuntu" {
    ami = var.image_id 
    disable_api_stop  = var.disable_api_stop 
    disable_api_termination = var.disable_api_termination  
    instance_type = var.this_list[0]
    #key_name=""
    vpc_security_group_ids = [var.vpc_security_group_ids]
    count = var.count  #loop #var.this_list[1]
    tags = {
      purpose = "webserver"
    } 
    

}    
