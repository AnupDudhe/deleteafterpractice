resource "aws_instance" "this_ubuntu" {

    ami = "ami-050cd642fd83388e4" 
    disable_api_stop  = false 
    disable_api_termination = false  
    instance_type = "t2.micro" 
    #key_name=""
    vpc_security_group_ids = ["sg-09d0f3b967811ad23" , ]
    count = 4  #loop 
    tags = {
      purpose = "webserver"
    } 
    

}    
