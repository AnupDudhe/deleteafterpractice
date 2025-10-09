variable "webserver_ami" {
   type = string 
}

variable "webserver_instance_type" {
   type = string 

}

variable "webserver_api_termination" {
   type = bool
}

variable "webserver_copy" {
   type = number
}

variable "webserver_defaulsgroup" {
   type = string
  
}

variable "ec2_instance_subnet" {
   type = string
} 