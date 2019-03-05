provider aws {
  region     = "${var.aws_region}"
  version    = "~> 1.50"
}

module vpc {
  source = "replicated.yet.org/yet/vpc/aws"
  version = "1.58.0"

  name = "${var.vpc_name}"

  # The CIDR block for the VPC.
  cidr = "10.0.0.0/16"

  azs             = "${var.availability_zones}"
  private_subnets = "${var.private_subnets}"
  public_subnets  = "${var.public_subnets}"

  assign_generated_ipv6_cidr_block = false

  # provision a single shared NAT Gateway across all private networks
  enable_nat_gateway = true
  single_nat_gateway = true

  # Additional tags for the public subnets
  public_subnet_tags = {
    Name = "pov_public"
  }

  # A map of tags to add to all resources
  tags = {
    usecase     = "pov"
    Terraform   = "true"
    Environment = "dev"
    Owner       = "infra team"
  }

  # Additional tags for the VPC
  vpc_tags = {
    Name = "pov_vpc"
  }

}
