variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-southeast-3"
}

variable "tfstate_s3_bucket_name" {
  description = "S3 bucket name to hold the tfstate file"
  type        = string
}