variable "service_name" {
  description = "An unique name that identifies your service. This will be used as prefix for many AWS resources."
  default     = "sharebook"
}

variable "environment" {
  description = "Environment name."
  default     = "prod"
}

variable "image_id" {
  description = "ID of the AMI which will be used to create your ECS instances."
  default     = "ami-0be9e1908fe51a590"
}

variable "instance_type" {
  description = "Instance type which will be used to created your ECS instances."
  default     = "t2.micro"
}
