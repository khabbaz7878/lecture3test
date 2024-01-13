myname="husni"

# variables.tfvars
listofstorageaccount=[
  {
    "name": "mystorageaccount1",
    "account_tier": "Standard",
    "account_replication_type": "GRS",
    "access_tier": "Hot",
    "cross_tenant_replication_enabled": false
  },
  {
    "name": "mystorageaccount2",
    "account_tier": "Premium",
    "account_replication_type": "LRS",
    "access_tier": "Cool",
    "cross_tenant_replication_enabled": true
  }
]

# Run Terraform with the -var-file argument
terraform apply -var-file="variables.tfvars"
