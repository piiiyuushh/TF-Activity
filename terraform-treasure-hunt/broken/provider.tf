terraform {
  required_version = ">= 0.12"
  backend "local" {               
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAT4BZUV53JCN4P"     
  secret_key = "dI7Z6/LNcqihZxY5lwV4G/Mt/MSJQXr8Kk0FH"     
}
