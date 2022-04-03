terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>3.14.1"
        }
    }
    required_version = "0.13.6"

    backend "s3" {
        bucket = "todo-dynamic-bucket"
        key = "terraform.tfstate"
        region = "eu-west-1"
    }
}

provider "aws" {
    region = "eu-west-1"
}

provider "helm" {
    kubernetes {
        config_path = "~/.kube/config"
    }
}

