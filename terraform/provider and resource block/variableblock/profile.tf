provider "aws" {
   profile = "configs"
    default_tags {
                tags = {
                    name = "aws"
                }
    }
}

