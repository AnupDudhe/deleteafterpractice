variable "This_Aws_UserName" {
    description = "user name"
    type = string
    default = "sai"
}
variable "This_Path" {
    description = "path"
    type = string
    default = "/"
}

variable "This_api_termination" {
    description = "for api termination"
    #type = bool
    #default = true
}

variable "This_count" {
    description = "for ec2 count"
    #type = number
    #default = 1
}

variable "This_map" {
    description = "for ec2 count"
   
}

variable "This_az" {
      
    }

variable "This_list" {
    description = "for ec2 count"
    type = list
    #default = ["ami-0427090fd1714168b",3,"default","webapp"]
}

variable "This_any" {
    description = "for ec2 count"
}

variable "This_sg" {
    
}