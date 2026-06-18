variable "amiid" {
    default = "ami-0f8a61b66d1accaee" 
}

variable "instancetype" {
    default =   "t3.medium"    
}


variable "instcount" {
  default = 1
}

variable "sg" {
  default = "sg-030613bddb89f08c9" 
}

variable "apiterm" {
    default = false
}

variable "keymap" {
    default = "sample"
}