resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = merge(var.common_tags, {
    Name = "${var.project_name}-vpc"
    environment = var.environment
    }
  )



}
resource "aws_subnet" "public" {
  for_each                = toset(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  map_public_ip_on_launch = true
  tags = merge(var.common_tags, {
    Name = "${var.project_name}-public-${each.value}"
  })



}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = merge(var.common_tags, {
    Name = "${var.project_name}-igw"
  })



}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(var.common_tags, {
    Name = "${var.project_name}-public-route-table"
  })
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id

}
resource "aws_subnet" "private" {
  for_each                = toset(var.private_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  map_public_ip_on_launch = false
  tags = merge(var.common_tags, {
    Name = "${var.project_name}-private-${each.value}"
  })
}
resource "aws_eip" "nat" {
  domain = "vpc"
  tags = merge(var.common_tags, {
    Name = "${var.project_name}-nat-eip"
  })

}
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = values(aws_subnet.public)[0].id
  tags = merge(var.common_tags, {
    Name = "${var.project_name}-nat"
  })

}