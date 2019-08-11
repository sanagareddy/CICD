provider "vault" {
 address = "http://127.0.0.1:8200"
 token = "s.bBxHvihd2rnjyKGrYHbKjYWr"
}

data "vault_aws_access_credentials" "cred1" {
  backend = "aws"
  role = "Role1"
}

provider "aws" {
  access_key = "${data.vault_aws_access_credentials.cred1.access_key}"
  secret_key = "${data.vault_aws_access_credentials.cred1.secret_key}"
  region = "ap-south-1"
}
