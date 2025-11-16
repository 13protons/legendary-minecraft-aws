provider "aws" {
  region = "us-east-2"
}

resource "aws_key_pair" "minecraft_key" {
  key_name   = "minecraft-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "minecraft_sg" {
  name        = "minecraft-sg"
  description = "Allow Minecraft and SSH"

  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 19132
    to_port     = 19132
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 19132
    to_port     = 19132
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "minecraft" {
  ami             = var.aws_ami_id # Loaded from environment variable or terraform.tfvars
  instance_type   = var.aws_instance_type
  key_name        = var.aws_key_pair_name
  security_groups = [var.aws_security_group_name]

  user_data = file("${path.module}/user-data.sh")

  tags = {
    Name = "LegendaryMinecraftServer"
  }
}
