#syntax variable "variablename" { default = "value" }


#variable simple data types 
# "storm" , "4"  -> string data type 
# 5 -> number data type 
# true / false - > boolean data type 
# 5.4 -> float 

variable "this_ami" {
  default = "ami-0c3389a4fa5bddaad"
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
    default = "sg-02a862f1a1dab84e5"
}

variable "this_count" {
    default = 1
}