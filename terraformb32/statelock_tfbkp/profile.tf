provider "aws" {
  region     = "us-east-1"
  profile = "configs" #masking
}

terraform {
    backend "s3" {
        bucket = "cbzb32"
        key = "terraform.tfstate"
        dynamodb_table = "cbzb32"
        region = "us-east-1"
        profile = "configs"
        shared_credentials_files = ["/home/anup/.aws/credentials"]
    }
}