

resource "aws_instance" "example3" {
   instance_type = "t3.micro"
   ami = each.value
   for_each = toset(var.ami_foreach)
}

variable "ami_foreach" {

    default = ["ami-00ca570c1b6d79f36" , "ami-02b8269d5e85954ef"]

}



resource "aws_iam_user"  "userexample2" {
   name = each.value
   for_each = toset(var.username2)

}

variable "username2" {
  default = ["user5" , "user4" , "user6"]
}

output "aws_id" {

value = [
    for amiid in var.ami_foreach:
       aws_instance.example3[amiid].id
 ]

 }