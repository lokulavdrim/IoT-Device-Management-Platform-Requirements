terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-state-iot-management-platform"
    key            = "all-services/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "TerraformLocks"
    encrypt        = true
  }
}
