################### VPC ###################
# Create the VPC
resource "aws_vpc" "cxy-terraform-vpc-section" { # Creating VPC here
  cidr_block           = var.input-vpc_cidr      # Defining the CIDR block use 10.0.0.0/24 for demo
  instance_tenancy     = var.input-instance_tenancy
  enable_dns_support   = var.input-enable_dns_support
  enable_dns_hostnames = var.input-enable_dns_hostnames

  tags = {
    Name = var.input-vpc_name # This sets the name of the VPC
  }
}

# Create Internet Gateway and attach it to VPC
resource "aws_internet_gateway" "cxy-terraform-igw-section" { # Creating Internet Gateway
  vpc_id = aws_vpc.cxy-terraform-vpc-section.id               # vpc_id will be generated after we create VPC

  tags = {
    Name = var.input-igw_name # This sets the name of the VPC
  }
}

# Create the Security Group for the VPC with [Security group name] === "default"
resource "aws_default_security_group" "cxy-terraform-vpc-sg" {
  vpc_id = aws_vpc.cxy-terraform-vpc-section.id

  # Allow all incoming
  # ***Note: Should be removed during deployment beyond local
  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  # Allow all outgoing
  # ***Note: Should be removed during deployment beyond local 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.input-igw_name # This sets the name of the igw
  }
}

################### PUBLIC subnet ###################
# Create a Public Subnets
resource "aws_subnet" "cxy-terraform-public-subnet-section" { # Creating Public Subnets
  vpc_id     = aws_vpc.cxy-terraform-vpc-section.id
  cidr_block = var.input-public_subnet_cidr # CIDR block of public subnets

  tags = {
    Name = var.input-public_subnet_name # This sets the name of the subnet
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
    Name = var.input-public_rt_name # This sets the name of the VPC
  }
}

# Route table Association with Public Subnet's
resource "aws_route_table_association" "public-subnet-public-routetable-associate" {
  subnet_id      = aws_subnet.cxy-terraform-public-subnet-section.id
  route_table_id = aws_route_table.cxy-terraform-public-routetable-section.id
}

################### PRIVATE subnet 1 ###################
# Creating Private Subnets
resource "aws_subnet" "cxy-terraform-private-subnet-section-1" {
  vpc_id            = aws_vpc.cxy-terraform-vpc-section.id
  cidr_block        = var.input-private_subnet_cidr_1 # CIDR block of private subnets
  availability_zone = var.input-private_subnet_az_1

  tags = {
    Name = var.input-private_subnet_name_1 # This sets the name of the subnet
  }
}

# Route table for PRIVATE Subnet
resource "aws_route_table" "cxy-terraform-private-routetable-section-1" { # Creating RT for Private Subnet
  vpc_id = aws_vpc.cxy-terraform-vpc-section.id

  tags = {
    Name = var.input-private_rt_name_1 # This sets the name of the route table
  }
}

# Route table Association with Private Subnet
resource "aws_route_table_association" "public-subnet-private-routetable-associate-1" {
  subnet_id      = aws_subnet.cxy-terraform-private-subnet-section-1.id
  route_table_id = aws_route_table.cxy-terraform-private-routetable-section-1.id
}

################### Private subnet 2 ###################
# Creating Private Subnet
resource "aws_subnet" "cxy-terraform-private-subnet-section-2" {
  vpc_id            = aws_vpc.cxy-terraform-vpc-section.id
  cidr_block        = var.input-private_subnet_cidr_2 # CIDR block of private subnets
  availability_zone = var.input-private_subnet_az_2

  tags = {
    Name = var.input-private_subnet_name_2 # This sets the name of the subnet
  }
}

# Route table for Private Subnet
resource "aws_route_table" "cxy-terraform-private-routetable-section-2" { # Creating RT for Private Subnet
  vpc_id = aws_vpc.cxy-terraform-vpc-section.id

  tags = {
    Name = var.input-private_rt_name_2 # This sets the name of the route table
  }
}

################### Private Subnet Group  ###################
#aws_db_subnet_group
resource "aws_db_subnet_group" "default" {
  name = var.input-aws_db_subnet_group_name
  subnet_ids = [
    aws_subnet.cxy-terraform-private-subnet-section-2.id,
    aws_subnet.cxy-terraform-private-subnet-section-1.id
  ]

  tags = {
    Name = var.input-aws_db_subnet_group_tags_name
  }
}
