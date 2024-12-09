include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/s3"
}

inputs = {
  bucket_name = "devops-test-app-aiya110202"
}