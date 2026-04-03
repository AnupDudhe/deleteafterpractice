module "ec2" {
     source = "/home/anup/deleteafterpractice/tfb34/module/resource/EC2"
     this_ami = "ami-01b14b7ad41e17ba4"
     this_inst = "t3.micro"
     this_key = "b34"
     this_api = false
     this_sg = "sg-033f2559c156114d8"
     subnetid = module.vpc.subnetid
     vpc_id = module.vpc.vpc_id
 }


module "vpc" {
   source = "/home/anup/deleteafterpractice/tfb34/module/resource/VPC"
   cidrbloc = "10.0.0.0/16"
   subnetbloc = "10.0.1.0/24"

}