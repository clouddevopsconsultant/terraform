#-- Configure Providers
provider "aws" {
  region = "us-east-2"
}

#-- Provision VPC
resource "aws_vpc" "myvpc1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "mehul"
  }
}

#-- Provision Subnet
resource "aws_subnet" "mysubnet1" {
  vpc_id     = aws_vpc.myvpc1.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "private-mehul"
  }
}

#-- Provision Keypair
resource "aws_key_pair" "mykey1" {
  key_name   = "mehul-21sep"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC604ApfKMC4eZd7OHHFBdHwLvl2Xt0HTWXDBWscxhVd2h1BLaxvNpnlZyKfqLRmGlb91hgWl/dplfcTdPR0oaqUqEwUOaZ46jC5YJA8jOhQr/ZDQZqhYuCtg5I+VBAidwKhIwxRXE5PY5gIJRIIyb1u91TTV4eRIS+uUN/c0obTZi24CFHMIV2eUTzm5bYBT/4IyKjOjuDgGUt/4Q2I+XVmUoEwlkP28kO8zcMSNysEEyTtEyshOj+C+UqzrxYv1nNxOC7R4Nf0QbjY9yiK8Eith6f4H60UzjsP9+M1WdDYTWQIOJyBfLGVIG8Sd/M7TpWV1T4sohg5Wi3ZQWEEi+n root@ip-172-31-55-26.ec2.internal"
}


#-- Provision Server with VPC, Subnet, Keypair 
resource "aws_instance" "myinstance1" {
  ami           = var.image
  instance_type = var.hw
  subnet_id     = aws_subnet.mysubnet1.id
  key_name      = aws_key_pair.mykey1.id
  tags = {
    Name = "Mehul-Server-21-Sep"
  }
}
#-- AMI to be ask during runtime
#-- HW default to t2.micro
#-- Server name to be ask during runtime.
