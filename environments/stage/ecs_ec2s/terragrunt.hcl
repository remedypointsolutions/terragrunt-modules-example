#environments/stage/ecs_lc/terragrunt.hcl
include {
  path = find_in_parent_folders()
}

locals {
  globals = yamldecode(file("${find_in_parent_folders("global_variables.yaml")}"))
}

terraform {
  source = "../../../modules/ecs_lc"
}

dependency "cloud" {
  config_path = "../cloud"
  mock_outputs = {
    public_subnets_ids = []
    vpc_id = ""
  }
}

inputs = merge(local.globals, {
  vpc_id = dependency.cloud.outputs.vpc_id
  subnet_ids = dependency.cloud.outputs.public_subnets_ids
})
