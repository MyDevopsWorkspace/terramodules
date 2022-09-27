resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidr_range
    enable_dns_hostnames = var.enable_dns_hostnames
    enable_dns_support = var.enable_dns_support
    tags = merge(var.tags,{Name = "${var.vpc_name}"})
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets) > 0 ? length(var.private_subnets) : 0
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private_subnets[count.index]
  availability_zone = var.private_subnets_az[count.index]
  map_public_ip_on_launch = false
  tags = merge(var.tags,{Name = "PrivateSN-${count.index}"})
  
}


resource "aws_subnet" "public" {
  count = length(var.public_subnets) > 0 ? length(var.public_subnets) : 0
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = var.public_subnets_az[count.index]
  map_public_ip_on_launch = false
  tags = merge(var.tags,{Name = "PublicSN-${count.index}"})
}

resource "aws_internet_gateway" "gw" {
  count = length(var.public_subnets) > 0 ? 1: 0
  vpc_id = aws_vpc.myvpc.id
  tags = var.tags
}

resource "aws_route_table" "public_sn" {
  count = length(var.public_subnets) > 0 ? 1: 0
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw[count.index].id
  }
 tags = var.tags
}


resource "aws_route_table_association" "a" {
  count = length(var.public_subnets) > 0 ? 1: 0
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_sn[count.index].id
}


