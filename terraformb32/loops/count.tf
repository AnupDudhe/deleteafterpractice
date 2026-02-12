resource "aws_instance" "webserver2" {
    count = 3
    ami = "ami-0c1fe732b5494dc14"
    instance_type = "t3.micro"
}

#count loop will be used where you have to create instances with same configuration. if you want to create instances with different configuration then we have to use for_each loop.