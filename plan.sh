#!/usr/bin/env bash
terraform plan -var-file="env\secret.tfvars" -var-file="env\remote.tfvars"