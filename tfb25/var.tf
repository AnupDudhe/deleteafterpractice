variable "this_image_id" {
  type        = string
  default = "ami-05ee755be0cd7555c"
}

variable "this_volsize" {
  type  = number
  default = 10 
}

variable "this_deleteont" {
  type = bool
  default = false 

}

variable "this_list" {
   type = list 
   default = ["gp3" , "t2.micro" , false , "gp2" , 50 ]
}

variable "this_map" {
    type = map 
    default = {
        voltype = "gp3" 
        secgroup = "sg-0243699f25e16090b"
        name = "webserver"
    }

}

variable "this_any" {
    type = any 
    default = {
        count = 1
        api_termination_ec2 = false
        api_stop_ec2 = false 
        ami_ec2 = "ami-05ee755be0cd7555c" 
        instance_type_list = ["t2.micro" , "t3.small" , "t3.large"]
        tags_map = {
           purposeec2 = "webserver" 
           name = "webserver"
        }

 }

}