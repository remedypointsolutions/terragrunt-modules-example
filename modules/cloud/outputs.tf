output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnets_ids" {
  value = module.network.public_subnets_ids
}
