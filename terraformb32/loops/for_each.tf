#scenarios create 3 ec2 instances having different ami. (ubuntu amazon linux windows)
resource "aws_instance" "webserver" {
    for_each = toset(var.aws_ami)
    ami = each.value
    instance_type = "t3.micro"
}

variable "aws_ami" {
   default = ["ami-0c1fe732b5494dc14" , "ami-0b6c6ebed2801a5cb" , "ami-06b5375e3af24939c" ]   #list data type      
}

output "aws_public_ip" {
    value = [for ami in var.aws_ami:
             aws_instance.webserver[ami].public_ip]
}

#for each will be used where instances have diff configs 
#for loop will be used where u need outputs of the instances which are created using loops