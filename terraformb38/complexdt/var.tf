


variable "amiid" {
    default = ["ami-0aa47c25091df3f7b" , "ami-07290b6b6b1f4d7b4" ]
}

variable "instancetype" {
    default = {
        instanceypemicro = "t3.micro"
        instancetypesmall =  "t3.small"
    }
}



variable "anyds" {
    default = {
        sg = "sg-09a2158a0b22cc46e"  #string , 
        instcount = 1 
        apiterm = [True , False]
        keymap = {
            key1 = "sample" ,
            key2 = "sample2" 
        }
    } 
    
}