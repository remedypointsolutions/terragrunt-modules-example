module "network" {
  source  = "cn-terraform/networking/aws"
  version = "2.0.7"

  name_preffix = var.name_preffix

  vpc_cidr_block                              = var.vpc_cidr_block
  availability_zones                          = var.availability_zones
  public_subnets_cidrs_per_availability_zone  = var.public_subnets_cidrs_per_availability_zone
  private_subnets_cidrs_per_availability_zone = var.private_subnets_cidrs_per_availability_zone
}
