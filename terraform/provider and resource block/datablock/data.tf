data "aws_ami" "this_aws_ami" {
    name_regex       = "ami_use"
      filter {
    name   = "name"
    values = ["ami_use"]
    }

}