variable "name" {
  description = "Name of the launch configuration."
}

variable "image_id" {
  description = "ID of the AMI that will be used to create the instance."
}

variable "iam_instance_profile" {
  description = "Profile that will be associated to the instance."
}

variable "instance_type" {
  description = "Instance Type."
}

variable "security_groups" {
  type = "list"
  description = "Security Group which will be associated to the instance."
}

variable "user_data" {
  description = "Script that will be executed when instances launch."
}
