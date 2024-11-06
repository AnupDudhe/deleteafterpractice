resource "aws_instance" "this_ubuntu" {
    ami = var.this_image_id 
    disable_api_stop  = var.this_disable_api_stop 
    disable_api_termination = var.this_disable_api_termination  
    instance_type = var.this_list[0]
    #key_name=""
    vpc_security_group_ids = [var.this_vpc_security_group_ids]
    count = var.this_count  #loop #var.this_list[1]
    tags = {
      purpose = "webserver"
    } 
    

}    
