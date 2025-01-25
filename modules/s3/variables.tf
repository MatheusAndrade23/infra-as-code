variable "s3_bucket_name" {
  type        = string
  default     = ""
  description = "Nome do Bucket"
}

variable "s3_tags" {
  type        = map(string)
  default     = {}
  description = "Tags do Bucket"
}
