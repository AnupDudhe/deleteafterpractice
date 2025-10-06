variable "webserver_ami" {
   type = string 
   default = "ami-08982f1c5bf93d976"

}

variable "webserver_instance_type" {
   type = string 
   default = "t2.micro"

}

variable "webserver_api_termination" {
   type = bool
   default = true
}

variable "webserver_copy" {
   type = number
   default = 2
}

