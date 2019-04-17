variable "service_name" {
  description = "An unique name that identifies your service. This will be used as prefix for many AWS resources."
}

variable "aws_access_key" {
}

variable "aws_secret_key" {
}

variable "aws_region" {
  default = "us-east-1"
}