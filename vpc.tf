variable "region" {
    default = "us-east-1"
}
data "aws_availability_zones" "available" {}
locals {
    cluster_name = "Demo-EKS-Cluster"
}
module vpc {
    source = "terraform-aws-modules/vpc/aws"

    name = "Demo-EKS-VPC"
    cidr = "10.0.0.0/16"

    azs = data.aws_availability_zones.available.names
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

    enable_nat_gateway = false
    single_nat_gateway = false

  enable_dns_hostnames= true
tags = {
    "Name" = "Demo-EKS-VPC"
}
private_subnet_tags = {
    "Name" = "Demo-Private-Subnet"
 }
}
