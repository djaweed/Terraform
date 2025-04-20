module "vpc" {
  source      = "../../modules/vpc"
  cidr_block  = var.cidr_block
  public_azs  = var.public_azs
  private_azs = var.private_azs
  name_prefix = var.environment
  tags        = var.tags
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
