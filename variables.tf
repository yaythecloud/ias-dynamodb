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
    description = "The type DynamoDB should expect as a hash_key. Example: string (S), number (N) or binary (B)"
    type        = string 
    default     = "S"
}

variable "range_key" {
    description = "The attribute to use as the range (sort) key."
    type        = string
    default     = ""
}

variable "range_type" {
    description = "The type DynamoDB should expect as a range_key. Example: string (S), number (N) or binary (B)"
    type        = string 
    default     = "S"
}

variable "write_capacity" {
    description = "The number of write units for this table. If billing_mode is PROVISIONED, this field is required."
    type        = number
    default     = 20
}

variable "read_capacity" {
    description = "The number of read units for this index. Must be set if billing_mode is PROVISIONED."
    type        = number
    default     = 20
}

variable "attribute" {
    description = "List of nested attribute definitions."
    type        = list(map(string))
    default     = []
}

variable "enabled" {
    description = "Indicates whether ttl is enabled."
    type        = bool
    default     = false
}

variable "attribute_name" {
    description = "The name of the table attribute to store the TTL timestamp in."
    type        = string
    default     = ""
}

variable "stream_enabled" {
    description = "Indicates whether Streams are to be enabled (true) or disabled (false)."
    type        = bool
    default     = false
}

variable "stream_view_type" {
    description = "When an item in the table is modified, StreamViewType determines what info is written to the tables stream. Valid values are KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES."
    type        = string
    default     = ""
}

variable "point_in_time_recovery" {
    description = "Whether to enable point-in-time recovery. Defaults to false."
    type        = bool
    default     = false
}