

resource "aws_iam_user" "main_user1" {
    name =  var.aws_user_name[count.index]
    count = length(var.aws_user_name)
}

 variable "aws_user_name" {
    type = list(string)
    default =  ["ubuntu","centos","mintos","solaris"]
} 
