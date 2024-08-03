module "ec2_module" {
        source = "/home/cloudshell-user/deleteafterpractice/Terraform/Module/resources/EC2"
        This_api_termination = true
        This_key = "anupnvdev"
        This_az  = "us-east-1a"
        This_tag =  "webapp"
        This_any = "t2.micro"
        This_sg  = "default"
}