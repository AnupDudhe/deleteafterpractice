resource "aws_instance" "this_ubuntu" {
    ami = var.this_image_id    #var.this_image_id 
    disable_api_stop  = var.this_disable_api_stop  #var.this_disable_api_stop 
    disable_api_termination =  var.this_disable_api_termination  #var.this_disable_api_termination  
    instance_type = var.this_list  #var.this_any.instance_type_list[0]
    subnet_id =  var.this_aws_instance_subnet 
}    

