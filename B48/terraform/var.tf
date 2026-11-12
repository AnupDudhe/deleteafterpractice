variable "this_webserverami" {
   default = "ami-0f19324397f53458f"
}

variable "this_instancetype" {
 default = "t3.micro"
}

variable "this_keypair" {
 default = "Linux_dev"
}

#variable "this_instcount" {
   # default = 2
#}

variable "this_apiterm" {
    default = false 
}

variable "this_sg" {
    default = "sg-02977f9ed12529e66"
}