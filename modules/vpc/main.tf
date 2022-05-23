terraform {
  required_version = ">= 0.12"
}

# Create the VPC
resource "aws_vpc" "cxy-terraform-vpc-section" { # Creating VPC here
  cidr_block       = var.main_vpc_cidr           # Defining the CIDR block use 10.0.0.0/24 for demo
  instance_tenancy = "default"

  tags = {
    Name = "cxy-terraform-vpc-name" # This sets the name of the VPC
  }
}

# Create Internet Gateway and attach it to VPC
resource "aws_internet_gateway" "cxy-terraform-igw-section" { # Creating Internet Gateway
  vpc_id = aws_vpc.cxy-terraform-vpc-section.id               # vpc_id will be generated after we create VPC

  tags = {
    Name = "cxy-terraform-igw-name" # This sets the name of the VPC
  }
}

# Create a Public Subnets
resource "aws_subnet" "cxy-terraform-public-subnet-section" { # Creating Public Subnets
  vpc_id     = aws_vpc.cxy-terraform-vpc-section.id
  cidr_block = var.public_subnets_cidr # CIDR block of public subnets

  tags = {
    Name = "cxy-terraform-public-subnet-name" # This sets the name of the VPC
  }
}

# Creating Private Subnets
resource "aws_subnet" "cxy-terraform-private-subnet-section" {
  vpc_id     = aws_vpc.cxy-terraform-vpc-section.id
  cidr_block = var.private_subnets_cidr # CIDR block of private subnets

  tags = {
    Name = "cxy-terraform-private-subnet-name" # This sets the name of the VPC
  }
}

# Route table for Public Subnet
resource "aws_route_table" "cxy-terraform-public-routetable-section" { # Creating RT for Public Subnet
  vpc_id = aws_vpc.cxy-terraform-vpc-section.id

  route {
    cidr_block = "0.0.0.0/0" # Traffic from Public Subnet reaches Internet via Internet Gateway
    gateway_id = aws_internet_gateway.cxy-terraform-igw-section.id
  }

  tags = {
    Name = "cxy-terraform-public-subnet-routetable-name" # This sets the name of the VPC
  }
}

# Route table for Private Subnet
resource "aws_route_table" "cxy-terraform-private-routetable-section" { # Creating RT for Private Subnet
  vpc_id = aws_vpc.cxy-terraform-vpc-section.id

  tags = {
    Name = "cxy-terraform-private-subnet-routetable-name" # This sets the name of the VPC
  }
}

# Route table Association with Public Subnet's
resource "aws_route_table_association" "public-subnet-public-routetable-associate" {
  subnet_id      = aws_subnet.cxy-terraform-public-subnet-section.id
  route_table_id = aws_route_table.cxy-terraform-public-routetable-section.id
}

# Route table Association with Private Subnet's
resource "aws_route_table_association" "public-subnet-private-routetable-associate" {
  subnet_id      = aws_subnet.cxy-terraform-private-subnet-section.id
  route_table_id = aws_route_table.cxy-terraform-private-routetable-section.id
}
