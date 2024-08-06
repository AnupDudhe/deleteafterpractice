
resource "aws_instance" "this_aws_instance" {
    for_each = toset(var.aws_ami)
    ami = each.value
    instance_type = "t3.medium"

    
} 

variable aws_ami {
       type = list(string)
       default = ["ami-03972092c42e8c0ca", "ami-0583d8c7a9c35822c", "ami-0b247d4d0226ca7cd" , "ami-04a81a99f5ec58529" ]
}


output "aws_public_ip" {
    value = [for instance in var.aws_ami:
    aws_instance.this_aws_instance[instance].public_ip]
}