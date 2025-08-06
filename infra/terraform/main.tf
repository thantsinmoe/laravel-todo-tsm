provider "aws" {
    region     = var.aws_region
} 

resource "aws_key_pair" "deployer" {
    key_name = var.key_name
    public_key = var.ssh_public_key
}

resource "aws_security_group" "web_sg" {
    name = "web_sg"
    description = "Allow SSH and HTTP"
    vpc_id = var.vpc_id

    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks  = ["0.0.0.0/0"]

    }

    ingress {
        description = "HTTP"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks  = ["0.0.0.0/0"]

    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks  = ["0.0.0.0/0"]        
    }
}

resource "aws_instance" "laravel" {
    ami                      = var.ami_id
    instance_type            = var.instance_type
    key_name                 = aws_key_pair.deployer.key_name
    vpc_security_group_ids   = [aws_security_group.web_sg.id] 

    tags = {
        Name = "Laravel-Todo-App"
    }
}