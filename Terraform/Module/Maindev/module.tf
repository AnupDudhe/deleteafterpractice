module "ec2" {
        source = "/home/anup/deleteafterpractice/Terraform/Module/resources/EC2"
        This_api_termination = true
        This_key = "anupnvdev"
        This_az  = "us-east-1a"
        This_tag =  "webapp"
        This_inst = "t2.micro"
        This_sg  = ["sg-09d5d9601120f72dd"]
        This_ami = "ami-03972092c42e8c0ca"


}

module "vpc" {
     




}