provider "aws" {
   profile = "configs"
    default_tags {
                tags = {
                    name = "aws"
                }
    }
}
#aws configure --profile configs
