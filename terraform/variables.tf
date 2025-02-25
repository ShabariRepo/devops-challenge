//Global variables
variable "access_key" { 
  default = "from tfvars"
}
variable "secret_key" { 
  default = "from tfvars"
}

variable "environment" {
  description = "Environment tagging for resources"
  default = "test"
}

variable "availability_zone" {
  type        = string
  description = "Availability Zone"
  default     = "us-east-1a" # "us-east-1c"] //,us-east-1c,us-east-1d"]
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "shared_credentials_file" {
  description = "AWS credentials file path"
  default     = "~/.aws/credentials"
}

variable "aws_profile" {
  description = "AWS profile"
  default     = "default"
}

