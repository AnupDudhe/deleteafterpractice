module "ec2" {
        source = "/home/cloudshell-user/deleteafterpractice/Terraform/Module/resources/EC2"
        This_api_termination = true
        This_key = "anupnvdev"
        This_az  = "us-east-1a"
        This_tag =  "webapp"
        This_inst = "t2.micro"
        This_sg  = "default"
        This_ami = "ami-0ba6a031e08a05649"
}