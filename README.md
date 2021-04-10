# ias-dynamodb

Terraform module which creates a DynamoDB table resource on AWS

The following resources will be created 

  - DynamoDB Table

*Important*: I am not setting a Terraform version on this module. 

### How to use this module

In your Terraforms root dir ```main.tf``` file create a new module and use this repo's git clone address as the source

```
module "dynamodb" {
    source = "git@github.com:yaythecloud/ias-dynamodb.git"
}
```

To adjust variables within the module, you will need to make these changes in ```.terraform/modules/${module}/main.tf```

### Default Deployment

If you run a ```terraform apply``` with the default configuration you will need to specify at least specify *table name* and *hash_key*

```
module "dynamodb" {
    source            = "./module"

    name              = "${var.environment}-vegetables"
    hash_key          = "vegetables"

    tags = {
        Terraform     = "true"
        IAS           = "true"
    }
}
```
