# ias-dynamodb

Terraform module which creates a DynamoDB table resource on AWS.

The following resources will be created

  - DynamoDB Table

**Important**: I am not setting a Terraform version on this module. 

The following variables are just for my tracking purposes and are not used in the module.

```
locals {
    release_version   = "0.1"
    terraform_version = "0.13"
    hashicorp_aws     = "3.35.0"
}
```

### How to use this module

In your Terraforms root dir ```main.tf``` file create a new module and use this repo's git clone address as the source.

```
module "dynamodb" {
    source = "git@github.com:yaythecloud/ias-dynamodb.git"
}
```

To adjust variables within the module, you will need to make these changes in ```.terraform/modules/${module}/main.tf```.

### Default Deployment

If you run a ```terraform apply``` with the default configuration you will need to specify at least specify *table name* and *hash_key*.

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
### Adding Tags

The module by default has a map of tags. To adjust these add key / value pairs to ```.terraform/modules/${module}/main.tf```.

```
module "dynamodb" {
    source            = "./module"

    name              = "${var.environment}-vegetables"
    hash_key          = "vegetables"

    tags = {
        Terraform     = "true"
        IAS           = "true"
        Purpose       = "tracking vegetables"
        Environment   = var.environment
    }
}
```

### Specifying Attribute (hash_key)

To specify an attribute add the attribute block below to ```.terraform/modules/${module}/main.tf```.

```
module "dynamodb" {
    source            = "./module"

    name              = "${var.environment}-vegetables"
    hash_key          = "vegetables"
    attribute_name    = "TimeToExist"
    enabled           = true

    attribute = [
        {
            name      = "vegetables"
            type      = "S"
        }
    ]

    tags = {
        Terraform     = "true"
        IAS           = "true"
    }
}
```

### Dynamo with TTL

To add TTL to the deployment, add the variables ```attribute_name``` and ```enabled``` to ```.terraform/modules/${module}/main.tf```.

```
module "dynamodb" {
    source            = "./module"

    name              = "${var.environment}-vegetables"
    hash_key          = "vegetables"
    attribute_name    = "TimeToExist"
    enabled           = true

    attribute = [
        {
            name      = "vegetables"
            type      = "S"
        }
    ]

    tags = {
        Terraform     = "true"
        IAS           = "true"
    }
}
```

### Dynamo Streams

To enable DynamoDB streams, add the variables ```stream_enabled``` and ```stream_view_type``` to ```.terraform/modules/${module}/main```.

```
module "dynamodb" {
    source            = "./module"

    name              = "${var.environment}-vegetables"
    hash_key          = "vegetables"
    attribute_name    = "TimeToExist"
    enabled           = true
    stream_enabled    = true
    stream_view_type  = "NEW_IMAGE"

    attribute = [
        {
            name      = "vegetables"
            type      = "S"
        }
    ]

    tags = {
        Terraform     = "true"
        IAS           = "true"
    }
}
```

### Point in Time Recovery

To enable point in time recovery, add the variable ```point_in_time_recovery``` to ```.terraform/modules/${module}/main```.

```
module "dynamodb" {
    source                 = "./module"

    name                   = "${var.environment}-vegetables"
    hash_key               = "vegetables"
    attribute_name         = "TimeToExist"
    enabled                = true
    stream_enabled         = true
    stream_view_type       = "NEW_IMAGE"
    point_in_time_recovery = true

    attribute = [
        {
            name           = "vegetables"
            type           = "S"
        }
    ]

    tags = {
        Terraform          = "true"
        IAS                = "true"
    }
}
```

**Module is managed by Tyler Webb, CEO and Founder of YAY THE CLOUD, LLC**