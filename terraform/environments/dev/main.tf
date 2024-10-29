provider "aws" {
    region = "us-east-1"
}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = "rentisafi-vpc-dev"
    cidr = "10.0.0.0/16"

    azs             = ["us-east-1a", "us-east-1b"]
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
    public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

    enable_nat_gateway = true
}

module "rds" {
    source = "../../modules/rds"

    environment = "dev"
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets
}

module "s3" {
    source = "../../modules/s3"

    environment = "dev"
}