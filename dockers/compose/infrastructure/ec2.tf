terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-2"
}

resource "aws_spot_instance_request" "jenkins_agent" {
  ami           = "ami-0c9fe0dec6325a30c"
  instance_type = "t2.micro"
  spot_price = "0.0044"
  spot_type = "one-time"


  tags = {
    Name = "jenkins_agent"
  }
}
