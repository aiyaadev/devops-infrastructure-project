locals {
  aws_region = "ap-southeast-1"
}

remote_state {
  backend = "s3"
  config = {
    bucket = "terraform-state-devops-test-aiya110202"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_region}"
}
EOF
}