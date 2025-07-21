resource "aws_instance" "this_aws_instancenew" {
    for_each = toset(var.imageid)
    ami = each.value
   // vpc_security_group_ids = ["sg-032e1a4a1685a03be"]
   // key_name = "delete_oregon_anup"
    instance_type = "t2.micro"
    tags = {
        name = webserver
    }
    
}

variable "imageid" {
    type = list(string)
    default = ["ami-05f991c49d264708f" , "ami-0987e9d53da324257"]

}