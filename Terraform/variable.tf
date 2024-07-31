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
    type = bool
    default = true
}

variable "This_count" {
    description = "for ec2 count"
    type = number
    default = 3
}

variable "This_map" {
    description = "for ec2 count"
    type = map
    default = {
        keyone = "anupnvdev" ,
        keytwo = "us-east-1a"
    }
}

variable "This_list" {
    description = "for ec2 count"
    type = list
    default = ["ami-0427090fd1714168b",3]
}

variable "This_any" {
    description = "for ec2 count"
    type = any
    default = {
       list =   ["sg-09d5d9601120f72dd"]
       string = "t2.micro"
       
    }
}

