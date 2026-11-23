


module "ec2" {
   source = "/home/anup/deleteafterpractice/B48/terraform/modulepractile/resources/EC2"
   this_webserverami = "ami-0f19324397f53458f" 
   this_instancetype = "t3.micro" 
   this_keypair = "Linux_dev" 
   this_apiterm = false 
   #this_sg = "sg-00ab26aafe31178ca" 
   ws_subnet = module.vpc.ws_subnetid

}



module "vpc" {
   source = "/home/anup/deleteafterpractice/B48/terraform/modulepractile/resources/VPC"
   vpc_cidr = "10.0.0.0/16" 
   subnet_cidr = "10.0.0.0/20"

}