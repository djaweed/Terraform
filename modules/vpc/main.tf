resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(var.tags, { Name = "${var.name_prefix}-vpc" })
}

resource "aws_subnet" "public" {
  for_each               = { for az in var.public_azs : az => az }
  vpc_id                 = aws_vpc.this.id
  cidr_block             = cidrsubnet(var.cidr_block, 8, index(var.public_azs, each.value))
  availability_zone      = each.value
  map_public_ip_on_launch = true
  tags = merge(var.tags, { Name = "${var.name_prefix}-public-${each.value}" })
}

resource "aws_subnet" "private" {
  for_each          = { for az in var.private_azs : az => az }
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, length(var.public_azs) + index(var.private_azs, each.value))
  availability_zone = each.value
  tags = merge(var.tags, { Name = "${var.name_prefix}-private-${each.value}" })
}
