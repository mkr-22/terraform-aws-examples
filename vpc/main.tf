#   AWS VPC Creation
resource "aws_vpc" "vpc_example" {
  cidr_block       = var.cidr_range
  instance_tenancy = "default"

  tags = {
    Name = "vpc-example"
  }
}

# AWS Subnet Creation
# Private Subnet
resource "aws_subnet" "private_subnet_example" {

  for_each = var.private_subnet_map

  vpc_id            = aws_vpc.vpc_example.id
  availability_zone = each.key
  cidr_block        = each.value


  tags = {
    Name = "private-subnet-${each.key}"
  }
}

#  Public Subnet
resource "aws_subnet" "public_subnet_example" {
  for_each = var.public_subnet_map

  vpc_id                  = aws_vpc.vpc_example.id
  availability_zone       = each.key
  cidr_block              = each.value
  map_public_ip_on_launch = true // Makes the subnet as Public 

  tags = {
    Name = "public-subnet-${each.key}"
  }
}

# Internet Gateway to Allow Accesss to Public Subnet to Access Outside of AWS
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_example.id

  tags = {
    Name = "igw-example"
  }
}

# Route Table for Public Subnet
resource "aws_route_table" "public_subnet_route_table" {
  vpc_id = aws_vpc.vpc_example.id

  # Allow all connection to go through IGW
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-subnet-rt"
  }
}

# Route Table Association with Public Subnets
resource "aws_route_table_association" "public_subnet_rt_association" {
  for_each = aws_subnet.public_subnet_example

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_subnet_route_table.id
}


# Route Table for Private Subnet
resource "aws_route_table" "private_subnet_route_table" {
  vpc_id = aws_vpc.vpc_example.id

  route = []

  tags = {
    Name = "private-subnet-rt"
  }
}

# Route Table Association with Public Subnets
resource "aws_route_table_association" "private_subnet_rt_association" {
  for_each = aws_subnet.private_subnet_example

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_subnet_route_table.id
}