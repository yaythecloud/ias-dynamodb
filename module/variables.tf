variable "tags" {
    description = "A map of tags to add to all resources"
    type        = map(string)
    default     = {}
}

variable "name" {
  description = "The name of the table, this needs to be unique within a region."
  type        = string
  default     = ""
}

variable "billing_mode" {
    description = "Controls how you are charged for read and write throughput and how you manage capacity. PROVISIONED, PAY_PER_REQUEST are valid values. Default is PROVISIONED"
    type        = string
    default     = "PROVISIONED"
}

variable "hash_key" {
    description = "The attribute to use as the hash (partition key)."
    type        = string
    default     = ""
}

variable "hash_type" {
    description = "The type DynamoDB should expect as a hash_key. Example: string (S) or number (N)"
    type        = string 
    default     = "S"
}

variable "range_key" {
    description = "The attribute to use as the range (sort) key."
    type        = string
    default     = ""
}

variable "range_type" {
    description = "The type DynamoDB should expect as a range_key. Example: string (S) or number (N)"
    type        = string 
    default     = "S"
}

variable "write_capacity" {
    description = "The number of write units for this table. If billing_mode is PROVISIONED, this field is required."
    type        = number
    default     = 10
}

variable "read_capacity" {
    description = "The number of read units for this index. Must be set if billing_mode is PROVISIONED."
    type        = number
    default     = 10
}

variable "attribute" {
    description = "Enables range_key attribute if range_key and range_type are set."
    type        = any 
    default     = []
}