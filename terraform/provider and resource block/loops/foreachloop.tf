


resource "aws_instance" "this_aws_instance" {
    for_each = toset(var.imageid)
    ami = each.value
    #vpc_security_group_ids = ["sg-032e1a4a1685a03be"]
    #key_name = "delete_oregon_anup"
    instance_type = "t2.micro"
    
}   

resource "aws_iam_user" "main_user"{
    for_each = toset(var.main_user_name)
    name = each.value
}

variable "main_user_name" {
    type = list(string)
   
    default = ["ubuntu","awslinux","windows"]
}

variable "imageid" {
    type = list(string)
    default = ["ami-012967cc5a8c9f891","ami-0866a3c8686eaeeba","ami-05b1a50d6798f63cb"]

}

output "aws_ec2" {
  value = [
    for instance in var.imageid:
        aws_instance.this_aws_instance[instance].public_ip
  ]
}