resource "aws_instance" "this_aws_instance" {
    for_each = toset(var.aws_ami)
    ami = each.value
    vpc_security_group_ids = ["sg-081787a4571bd9c08"]
    key_name = "mumbai-region"
    instance_type = "t2.micro"
    
} 

variable aws_ami {
       type = list(string)
       default = ["ami-03972092c42e8c0ca", "ami-0583d8c7a9c35822c", "ami-0b247d4d0226ca7cd" , "ami-04a81a99f5ec58529" ]
}