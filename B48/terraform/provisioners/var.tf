variable "this_webserverami" {
   default = "ami-0593d733c2fc5bd2e"
}

variable "this_instancetype" {
 default = "t3.micro"
}

variable "this_keypair" {
 default = "sample"
}


variable "this_apiterm" {
    default = false 
}

variable "this_sg" {
    default = "sg-00ab26aafe31178ca"
}