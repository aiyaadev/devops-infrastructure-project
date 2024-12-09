include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

terraform {
  source = "../../modules/eks"
}

inputs = {
  cluster_name    = "devops-test-eks"
  cluster_version = "1.27"
  vpc_id          = dependency.vpc.outputs.vpc_id
  private_subnet_ids = dependency.vpc.outputs.private_subnet_ids
}