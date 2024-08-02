provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" { 
  ami             = "ami-0ba9883b710b05ac6"
  instance_type   = "t2.micro"
  key_name        = "sudha"
  security_groups = [ "allow_ssh" ]
}

resource "aws_security_group" "demo-sg" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic and all outbound traffic"

    tags = {
    Name = "SSH_Port"
  }

  ingress {
    description = "SSH Access"
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