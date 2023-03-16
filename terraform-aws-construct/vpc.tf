module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "EKS-production-vpc"



  cidr           = "192.168.0.0/16"
  azs            = slice(data.aws_availability_zones.available.names, 0, 3)
  public_subnets = ["192.168.1.0/24", "192.168.2.0/24"]

  enable_dns_hostnames = true
  enable_dns_support   = true
  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1

  }
}
