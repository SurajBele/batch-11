terraform {
    backend "s3" {
        bucket = "batch-11-terraform"
        region = "us-east-1"
        key = "terraform.tfstate" 
    }
}
provider "aws" {
  region = "us-east-1"
}

modules "myinstance"{
source = ./instance
image_id = 
key_pair =
instance_type =  

}
