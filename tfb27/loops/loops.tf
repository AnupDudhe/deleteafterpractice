provider "aws" {
      region = "us-west-2"
      profile = "configs"
      shared_credentials_files = ["/home/anup/.aws/credentials"]
    
}

resource "aws_instance" "this_aws_instancenew" {
    for_each = toset(var.imageid)
    ami = each.value
   // vpc_security_group_ids = ["sg-032e1a4a1685a03be"]
   // key_name = "delete_oregon_anup"
    instance_type = "t2.micro"
    tags = {
        name = "webserver"
    }
   
    
}

variable "imageid" {
    type = list(string)
    default = ["ami-01102c5e8ab69fb75" , "ami-03aa99ddf5498ceb9"]

}


output "aws_ec2" {
  value = [
    for amiid in var.imageid:
        aws_instance.this_aws_instancenew[amiid].public_ip
  ]
}