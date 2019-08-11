provider "vault" {
}

data "vault_aws_access_credentials" "creds1" {
  backend = "aws"
  role = "Role1"
}

provider "aws" {
  access_key = "${data.vault_aws_access_credentials.creds1.access_key}"
  secret_key = "${data.vault_aws_access_credentials.creds1.secret_key}"
  region = "ap-south-1"
}
