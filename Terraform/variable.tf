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
    type = boolean
    default = true
}

variable "This_count" {
    description = "for ec2 count"
    type = number
    default = 3
}

