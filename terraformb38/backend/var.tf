

variable "this_ami" {
   default = "ami-0b3c69cd8456a2e2e" 
}


variable "This_instance_type" {
    default  = "t3.micro"
}

variable "This_vpc_security_group_ids" {default = "sg-062fb9052d023e993"}

variable "this_count" {
    default = 1
}

variable "this_disable_api_termination" {
    default =  false
}