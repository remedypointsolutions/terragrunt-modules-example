#environments/stage/cloud/terragrunt.hcl
include {
  path = find_in_parent_folders()
}

locals {
  globals = yamldecode(file("${find_in_parent_folders("global_variables.yaml")}"))
}

terraform {
  source = "../../../modules/cloud"
}

inputs = merge(local.globals, {
  availability_zones = ["us-east-1a", "us-east-1b"]

  enable_public_lb = false
})
