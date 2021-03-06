terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

resource "aws_vpc" "danny" {
  cidr_block = "192.168.99.0/24"
  tags = {
    Name = "danny"
  }
}

resource "aws_subnet" "web_tier_subnet" {
  vpc_id     = aws_vpc.danny.id
  cidr_block = "192.168.99.0/27"

  tags = {
    Name = "web_tier_subnet"
  }
}

resource "aws_subnet" "app_tier_subnet" {
  vpc_id     = aws_vpc.danny.id
  cidr_block = "192.168.99.32/27"

  tags = {
    Name = "app_tier_subnet"
  }
}

resource "aws_subnet" "db_tier_subnet" {
  vpc_id     = aws_vpc.danny.id
  cidr_block = "192.168.99.64/28"

  tags = {
    Name = "db_tier_subnet"
  }
}