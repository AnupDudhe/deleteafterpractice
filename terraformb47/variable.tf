variable "this_instancetype" {
    type = string
    default = "t2.micro"
}

variable "this_ami_id" {
    type = string
    default = "ami-05c179eced2eb9b5b"
}

variable "this_keyname" {
    type = string
    default = "b25"  

}

variable "this_tags" {
    type = string
    default = "webserver"
}


variable "this_count" {
    type =  number 
    default = 2
}

variable "this_availability_zone" {
   type = string 
   default = "ap-south-1b"
}

variable "this_user_data_base64" {
   type = bool
   default = true

}


 




