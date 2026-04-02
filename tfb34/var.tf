#syntax variable "variablename" { default = "value" }


#variable simple data types 
# "storm" , "4"  -> string data type 
# 5 -> number data type 
# true / false - > boolean data type 
# 5.4 -> float 

variable "this_ami" {
  default = "ami-01b14b7ad41e17ba4"
}

variable "this_inst" {
   default =  "t3.micro"
}

variable "this_key" {
    default = "b34"
}

variable "this_api" {
    default = false 
}

variable "this_sg" {
    default = "sg-033f2559c156114d8"
}

variable "this_count" {
    default = 1
}