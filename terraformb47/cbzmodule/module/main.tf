module  "ec2" {
    source = "./ec2"
      This_api_termination = true
        This_key = "b25"
        This_az  = "ap-south-1c"
        This_tag =  "webapp"
        This_inst = "t2.micro"
        #This_sg  = ["sg-09d5d9601120f72dd"]
        This_ami = "ami-05c179eced2eb9b5b"
        this_aws_vpc_id = module.aws_vpc.aws_vpc_id
        this_aws_instance_subnet = module.aws_vpc.subnet_id
}

module "aws_vpc" {
        source = "/home/anup/deleteafterpractice/Terraform/Module/resources/VPC"
        this_vpc_cidr_block = "192.168.0.0/16"
        this_vpc_cidr_tags = "vpc"
        this_public_cidr_block  = "192.168.0.0/17"
        this_public_map_pub = true
        this_public_tags = "public"
}