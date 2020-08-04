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

})
