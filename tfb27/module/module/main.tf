module  "ec2" {
    source = "/root/deleteafterpractice/tfb27/module/resources/ec2"
      This_api_termination = true
        This_key = "anrandive"
        This_az  = "ap-south-1c"
        This_tag =  "webapp"
        This_inst = "t3.micro"
        This_ami = "ami-0861f4e788f5069dd"
        this_aws_vpc_id = module.aws_vpc.aws_vpc_id
        this_aws_instance_subnet = module.aws_vpc.subnet_id
}

module "aws_vpc" {
        source = "/root/deleteafterpractice/tfb27/module/resources/vpc"
        this_vpc_cidr_block = "192.168.0.0/16"
        this_vpc_cidr_tags = "vpc"
        this_public_cidr_block  = "192.168.0.0/17"
        this_public_map_pub = true
        this_public_tags = "public"
}