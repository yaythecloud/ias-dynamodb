resource "aws_dynamodb_table" "dynamo" {
    name           = var.name
    billing_mode   = var.billing_mode
    read_capacity  = var.read_capacity
    write_capacity = var.write_capacity
    hash_key       = var.hash_key
    range_key      = var.range_key

    attribute {
        name = var.hash_key
        type = var.hash_type
    }
    
    tags = merge(
      var.tags
    )
}