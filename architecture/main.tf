terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
    random = {
      source = "hashicorp/random"
      version = "2.3.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region  = var.region
  profile = var.profile
}
module "policies" {
  # Gerencia todas as policies e roles da arquitetura
  source = "./modules/policies"

  region = var.region
  profile = var.profile
}

module "machine_learning" {
  # Gerencia recursos de storage, como S3 e Glue Table
  source = "./modules/machine_learning"

  region = var.region
  profile = var.profile
  project_name = var.project_name
  repository_url = "https://github.com/MarcosMota/Mercedes-Benz-Prediction.git"
  role_sagemake_arn = module.policies.iam_sagemaker_role
}