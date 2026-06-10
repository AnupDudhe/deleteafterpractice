variable "this_key_name" {
   default = "" 

}

variable "this_ami" {
   default = "ami-0eab37cfdc33e8e65" 
}


variable "This_instance_type" {
    default  = "t3.micro"
}

variable "This_vpc_security_group_ids" {default = "sg-0efc868be83f601ce"}

variable "this_count" {
    default = 4
}

variable "this_disable_api_termination" {
    default =  false
}