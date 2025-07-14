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

