#EC2 vairables
  webserver_ami = "ami-0fa3fe0fa7920f68e" 
  webserver_instance_type = "t2.micro" 
  webserver_key_name = "30july"
  webserver_disable_api_termination = false 
  webserver_subnetA = module.vpc.subnet_id
  webserver_sg =  module.vpc.webserver_sg

#VPC variables 

  vpc_cidr = "172.30.0.0/16" 
  vpc_subnetA = "172.30.128.0/20" 
  public_ip = true



#explicit and implicit dependencies.
#list,map,any data types.  

#terraforma apply -auto-approve -> prod env 
#terraform apply -var-file=dev.tfvars  -> dev env 
#terraform apply -var-file=test.tfvars -> test env 