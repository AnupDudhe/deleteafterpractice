variable "this_image_id" {
  type        = string
}

variable "this_disable_api_stop" {
  type   = bool
}
variable "this_disable_api_termination" {
    type = bool 
    description = "this variable is used to pass bool data to api_termination" 
}
variable "this_count" {
    type = number 
    default = 2
     
}
variable "this_vpc_security_group_ids" {
    type = string 
    default = "sg-0505874879e7ce6cd"
     
}

variable "this_list" {
    type = string
     
}

variable "this_map" {
    type = map  
    default = {
     purposeec2 = "webserver"   
     termination = true 
     count = 1

    }
     
}


variable "this_any" {
    type = string 
    api_termination_ec2 = false
}

variable "this_any2" {
    type = string 
    api_stop_ec2 = false
}

variable "this_aws_instance_subnet" {
     type = string
}