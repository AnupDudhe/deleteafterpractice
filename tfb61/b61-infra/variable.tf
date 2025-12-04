variable "webserver_ami" {
   default = "ami-0fa3fe0fa7920f68e"
}
variable "webserver_instance_type" {
   default = "t3.micro"
}
variable "webserver_key_name" {
   default = "30july"
}
variable "webserver_vpc_security_group_ids" {
   default = "sg-0bbfe8e7d4bf3c179"
}
variable "webserver_disable_api_termination" {
   default = false
}


#variable "webserver_count" {
 #  default = 2
#}