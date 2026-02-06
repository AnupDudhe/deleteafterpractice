 webserver_ami = "ami-0532be01f26a3de55"
  webserver_instance_type = "t3.micro"
  webserver_keyname = "ubuntu"
  webserver_disable_api_termination = false
  webserver_sg = module.vpc.webserversg
  webserver_subnetA = module.vpc.subnet_id

  vpc_cidr = "172.30.0.0/16"
  vpc_subnetA = "172.30.128.0/20"
  public_ip = true
  az = "us-east-1a"