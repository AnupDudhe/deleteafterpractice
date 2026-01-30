resource "aws_instance" "this_aws_instance_foreach" {
     instance_type = "t2.micro"
     for_each = toset(var.instance_ami_fe)  #will convert the list into set
     ami = each.value
  
}

variable "instance_ami_fe" {
  default = ["ami-08982f1c5bf93d976" , "ami-0360c520857e3138f "]
}   

resource "aws_iam_user" "this_iam_user_foreach" {
    
    for_each = toset(var.this_user_fe)
    name = each.value
}

variable "this_user_fe" {
    default = [ "ronaldo" , "messi" , "zlatan" ]
}



output "instanceip" {
    value = [
        for instanceami in var.instance_ami_fe :
        aws_instance.this_aws_instance_foreach[instanceami].public_ip
    ]
  
}