module "ec2" {
  source = "ubuntu/deleteafterpractice/tfb28/module/resources/ec2"
  webserver_ami = "ami-08982f1c5bf93d976"  
  webserver_instance_type = "t2.micro" 
  webserver_api_termination = false
  webserver_copy = 2 
  webserver_defaulsgroup = "sg-0d1eccf2d4ec11307"
  ec2_instance_subnet = module.vpc.subnet_id
}

module "vpc" {
    source = "ubuntu/deleteafterpractice/tfb28/module/resources/vpc"
    vpc_cidr = "192.168.0.0/16" 
    this_vpc_cidr_subnet =  "192.168.0.0/17" 
    this_map_public_ip_on_launch = true 
    this_public_tags = "webserver-public-subnet"
  
}