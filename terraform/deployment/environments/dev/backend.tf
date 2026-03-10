terraform {
  required_version = ">= 1.4.0"

  backend "s3" {
    bucket         = "threat-composer-tf-state-zuheyr-001"
    key            = "dev/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "threat-composer-tf-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
