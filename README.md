
To combine Terraform with InSpec just execute the following:

```
cd terraform
# download the required plugins
terraform init

# run terraform to apply the changes
terraform apply -var 'key_name=terraform' -var 'public_key_path=~/.ssh/id_rsa.pub'

# make terraform variables available to inspec
terraform output --json > test/verify/files/terraform.json

# run the inspec profile to verify the setup
inspec exec test/verify -t aws://
```





