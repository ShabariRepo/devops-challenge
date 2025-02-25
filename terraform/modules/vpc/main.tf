resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block_range
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    env = var.environment
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    env = var.environment
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet1_cidr_block_range
  map_public_ip_on_launch = "true"
  availability_zone = var.availability_zone
  tags = {
    env = var.environment
    exposure = "public"
  }
}
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
  }
tags = {
    env = var.environment
  }
}
resource "aws_route_table_association" "rta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_key_pair" "ec2access" {
  key_name = "publicKey"
  public_key = file(var.public_key_path)
}