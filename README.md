ha-rabbitmq-cluster-docker-swarm
=========


![Logical Architecture](.github/cluster_rabbitmq.png)


Set AWS access
------------------------------
```sh
$ export TF_VAR_aws_access_key=...your_aws_access_key...
$ export TF_VAR_aws_secret_key=...your_aws_secret_key...
```

Init S3 remote state
------------------------------
```sh
$ cd remote-state
$ terraform init
$ terraform apply
```

Terraform Init
------------------------------
```sh
$ terraform init -backend-config="access_key=..." -backend-config="secret_key=..."
```

Terraform Apply
------------------------------
```sh
$ terraform apply
```

Terraform Destroy
------------------------------
```sh
$ terraform destroy
```