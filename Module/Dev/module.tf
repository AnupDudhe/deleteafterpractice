
module "ec2" {
    source = "/home/cloudshell-user/deleteafterpractice/Module/Resources/EC2"
    this_image_id = "ami-09b0a86a2c84101e1"
    this_list = "t2.micro"
    #this_vpc_security_group_ids = "sg-0505874879e7ce6cd"
   
    #this_aws_instance_subnet = module.vpc.subnet_id
    #this_sg_vpc_id = module.vpc.vpc_id
    //this_aws_vpc_id = module.aws_vpc.aws_vpc_id
}