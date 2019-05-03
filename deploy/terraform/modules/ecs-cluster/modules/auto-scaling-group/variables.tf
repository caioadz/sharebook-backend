variable "name" {
  description = "Name tag for your Auto Scaling Group."
}

variable "desired_capacity" {
  description = "The number of instances the group should have at any time."
}

variable "health_check_grace_period" {
  default     = 300
  description = "The length of time that Auto Scaling waits before checking an instance's health status."
}

variable "launch_configuration" {
  description = "The name of the launch configuration associated with this Auto Scaling group."
}

variable "vpc_zone_identifier" {
  type = "list"
  description = "A list of subnets where your instances will be launched."
}