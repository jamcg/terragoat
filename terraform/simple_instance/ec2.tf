provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "eada7282b576093cd351981fbb95e0f9cc3524e0"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-01 13:24:45"
    git_last_modified_by = "7832952+jamcg@users.noreply.github.com"
    git_modifiers        = "7832952+jamcg"
    git_org              = "jamcg"
    git_repo             = "terragoat"
    yor_trace            = "0d04fa0f-e117-412b-bb3f-e104277ef9b9"
    owner                = "smelotte"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "eada7282b576093cd351981fbb95e0f9cc3524e0"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-01 13:24:45"
    git_last_modified_by = "7832952+jamcg@users.noreply.github.com"
    git_modifiers        = "7832952+jamcg"
    git_org              = "jamcg"
    git_repo             = "terragoat"
    yor_trace            = "2286a96f-f1c8-4d2b-bc51-339d8aee766a"
    owner                = "smelotte"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
