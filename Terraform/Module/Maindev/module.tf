module "ec2_module" {
        source = "/home/cloudshell-user/deleteafterpractice/Terraform/Module/resources/EC2"
        This_api_termination = true
        This_map = "anupnvdev"
        This_az  = "us-east-1a"
        This_list =  "webapp"
        This_any = "t2.micro"
        This_sg  = "default"
}