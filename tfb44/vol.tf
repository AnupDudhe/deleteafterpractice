# 1. Tell Terraform to use AWS
provider "aws" {
  region = "us-east-1" 
}

# 2. Create the EC2 Instance
resource "aws_instance" "my_server" {
  ami               = "" # Change to a valid AMI for your region
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"            # Crucial: Must match the volume zone!

  tags = {
    Name = "MyTerraformServer"
  }
}

# 3. Create the Extra Storage (EBS Volume)
resource "aws_ebs_volume" "my_volume" {
  availability_zone = "us-east-1a"            # Must be the exact same zone as the EC2
  size              = 10                      # Size in Gigabytes (GB)
  type              = "gp3"                   # Fast and modern general-purpose SSD

  tags = {
    Name = "MyExtraStorage"
  }
}

# 4. Glue Them Together (Attach the Volume to the Instance)
resource "aws_volume_attachment" "my_volume_attachment" {
  device_name = "/dev/sdh"                    # How the drive will show up inside Linux
  volume_id   = aws_ebs_volume.my_volume.id   # Grabs the ID of the volume made above
  instance_id = aws_instance.my_server.id     # Grabs the ID of the server made above
}
