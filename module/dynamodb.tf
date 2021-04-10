resource "aws_dynamodb_table" "dynamo" {
    name           = var.name
    billing_mode   = var.billing_mode
    read_capacity  = var.read_capacity
    write_capacity = var.write_capacity
    hash_key       = var.hash_key
    range_key      = var.range_key

    # not dynamic because hash_key is required
    attribute {
        name = var.hash_key
        type = var.hash_type
    }

    dynamic "attribute" {
      for_each = var.attribute

      content {
        name = var.range_key
        type = var.range_type
      }
    }

    ttl {
      attribute_name = var.attribute_name
      enabled = var.enabled
    }

    tags = merge(
      var.tags
    )
}