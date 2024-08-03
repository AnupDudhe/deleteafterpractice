module "ec2" {
        source = "/home/anup/deleteafterpractice/Terraform/Module/resources/EC2"
        This_api_termination = true
        This_key = "anupnvdev"
        This_az  = "us-east-1a"
        This_tag =  "webapp"
        This_inst = "t2.micro"
        This_sg  = ["sg-09d5d9601120f72dd"]
        This_ami = "ami-03972092c42e8c0ca"
        #this_aws_vpc_id = module.aws_vpc.aws_vpc_id
        #this_aws_instance_subnet = module.aws_vpc.aws_subnet_this_public


}

module "vpc" {
        source = "/home/anup/deleteafterpractice/Terraform/Module/resources/VPC"
        this_vpc_cidr_block = "192.168.0.0/16"
        this_vpc_cidr_tags = "vpc"
        this_public_cidr_block  = "192.168.0.0/17"
        this_public_map_pub = true
        this_public_tags = "public"
}