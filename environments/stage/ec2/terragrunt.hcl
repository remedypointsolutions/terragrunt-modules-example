#environments/stage/ec2/terragrunt.hcl
include {
  path = find_in_parent_folders()
}

locals {
  globals = yamldecode(file("${find_in_parent_folders("global_variables.yaml")}"))
}

terraform {
  source = "../../../modules/ec2"
}

dependency "cloud" {
  config_path = "../cloud"
  mock_outputs = {
    public_subnets_ids = ["temporary-dummy-name"]
    vpc_id = "temporary-vpc-id"
  }
}

dependency "ecs" {
  config_path = "../ecs"
  mock_outputs = {
    name = "temporary-dummy-name"
  }
}

inputs = merge(local.globals, {
  name = dependency.ecs.outputs.name

  vpc_id = dependency.cloud.outputs.vpc_id
  subnet_ids = dependency.cloud.outputs.public_subnets_ids
})
