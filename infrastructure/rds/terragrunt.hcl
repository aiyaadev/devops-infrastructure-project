include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

terraform {
  source = "../../modules/rds"
}

inputs = {
  identifier = "devops-test-db"
  db_name    = "devopstest"
  username   = "dbadmin"
  vpc_id     = dependency.vpc.outputs.vpc_id
  subnet_ids = dependency.vpc.outputs.private_subnet_ids
}