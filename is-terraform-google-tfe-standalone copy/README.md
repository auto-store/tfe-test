# Implementation Service TFE Standalone Accelerator

Terraform modules for deploying production ready Terraform Enterprise platform.

## Goals vs. !Goals

*What is this repository meant to do?*

The goal of this repository is to accelerate the installation of TFE for our clients across several common scenarios. In other words, this should get you 80% (or more) of what you need to deploy TFE Standalone.

*What is this repository **NOT** meant to do?*

This repository does not claim or meant to be the single golden standard for the installation of TFE.
It is not expected that this repository can be used as-is, with zero modification, rather is customized per installation by swapping out and modifying the existing submodules.

## How to use this repository for a client

> Note: This is by no means the only way to interact with this repository, but simply the general idea of how it is intended to be used.

1. Create a branch off of master.
2. Pick the example that matches your use case the closest (see below).
3. Create a folder specific to the client (i.e. ./clients/SOME-BIG_COMPANY) and copy over the example.
4. Customize the code to your use case, testing in a sandbox environment.
5. Test and Validate things work as expected.
6. Zip up the code and ship to the client for code review, getting the code into their source control.
7. Deploy and Validate in the client environment.
8. Contribute back to master and example, submodule, or documentation changes that could be helpful.

##  Specific Examples

There are several end to end examples to demonstrate a few common scenarios.

Each example can be run to go from nothing, to deployed TFE application.

### Public Load Balancer

The only example

## GCP Highlights & Gotchas

Notes around Azure specifics.

- Base RHEL image doesnt support cloud init, you can use the GCP startup script though (BASH).

### Auto Self Heal

Check repairs.

```sh
gcloud compute operations list --filter='operationType~compute.instances.repair.*'
```

## TODO

- [ ] Add more TODO items

## Known Issues

Some Known Issues

- none?

## Tools

Here are a few helpful tools for working with this repository.

### [sshuttle](https://github.com/sshuttle/sshuttle)

Poor man's VPN, allows proxy access through a bastion to get to private network instances.

**config**
```sh
ssh_ident="./.terraform/id_rsa.pem"
ssh_username="tfeadmin"
ssh_bastion="bastion-credible-kitten.centralus.cloudapp.azure.com"
ssh_cidr="10.0.0.0/24"
ssh_instance="10.0.0.6"
```

**bastion**
```sh
ssh-add $ssh_ident && sshuttle -r "${ssh_username}@${ssh_bastion}" $ssh_cidr
```

**client**
```sh
ssh-add $ssh_ident && ssh "${ssh_username}@${ssh_instance}"
```

### [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)

Great utility for keep documentation up to date, also used for formatting and light validation.

```sh
brew install pre-commit terraform-docs
```

Ensure versions are at least:
* pre-commit >= 1.20.0
* terraform-docs >= 0.8.2

```sh
brew upgrade pre-commit terraform-docs
```

[terraform-docs](https://github.com/segmentio/terraform-docs)
