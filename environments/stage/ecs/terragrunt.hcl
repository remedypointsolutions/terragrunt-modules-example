#environments/stage/ecs/terragrunt.hcl
include {
  path = find_in_parent_folders()
}

locals {
  globals = yamldecode(file("${find_in_parent_folders("global_variables.yaml")}"))
}

terraform {
  source = "../../../modules/ecs"
}

inputs = merge(local.globals, {

})
