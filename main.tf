# VPC creation
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "vpc-1"
  }
}

# Subnet creation
resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr
 map_public_ip_on_launch = true
  tags = {
    Name = "subnet-1"
  }
}

# Internet Gateway creation
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "igw-1"
  }
}

# Route Table creation
resource "aws_route_table" "my_route_table" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "route-table-1"
    }
    }

# Route creation
resource "aws_route" "my_route" {
    route_table_id         = aws_route_table.my_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.my_igw.id 
}

# Route Table Association
resource "aws_route_table_association" "my_route_table_assoc" {
    subnet_id      = aws_subnet.my_subnet.id
    route_table_id = aws_route_table.my_route_table.id
}


# Security Group creation
resource "aws_security_group" "my_sg" {
    name        = "my-security-group"
    description = "Allow SSH and HTTP"
    vpc_id      = aws_vpc.my_vpc.id
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "my-security-group"
    
    }
}

# EC2 Instance creation
resource "aws_instance" "my_instance" {
    ami           = var.ami_id
    instance_type = var.instance_type
    subnet_id     = aws_subnet.my_subnet.id
    key_name      = var.key_name
    security_groups = [aws_security_group.my_sg.id]
    user_data = file("install.sh")

    root_block_device {
        volume_size = var.volume_size
        volume_type = "gp3"
    }

    tags = {
        Name = "my-ec2-instance"
    }
}
