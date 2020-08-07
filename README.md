# Terraform/Terragrunt Modules Example

This repo shows the way to use terraform modules wrapped with Terragrunt.

It almost the same as our previous infrastructure, but allows to update single resources without provisioning whole infrastructure.

## How to use

* Load AWS Credentials in active Terminal session;
* Go to `environments/stage` directory;
* (1) Run `terragrunt plan-all` to provise all infrastructure modules;
* (2) Go to specific directory (for example, `ecs`), run `terragrunt plan` to provise only `ecs` part of the infrastructure;

## Future development

`modules` directory should be terminated & each module should migrate to separate `github` repository with semantic versioning.
