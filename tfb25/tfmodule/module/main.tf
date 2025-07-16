module "ec2" {
   source = "/root/deleteafterpractice/tfb25/tfmodule/resource/EC2"
   this_image_id = "ami-05ee755be0cd7555c"
   this_volsize = 10 
   this_deleteont = false 
   instance_type_list = "t2.micro"
   this_voltype = "gp3"
   this_name = "webserver" 
   this_purposeec2 = "webserver" 
   this_aws_instance_subnet = module.vpc.subnet_id
}

module "vpc" {
    source = "/root/deleteafterpractice/tfb25/tfmodule/resource/VPC"
    this_vpc_cidr_block = "192.168.0.0/16"
    this_vpc_cidr_tags = "vpc"
    this_public_cidr_block  = "192.168.0.0/17"
    this_public_map_pub = true
    this_public_tags = "public"



}