variable "name" {
  description = "Name tag of the ECS Service."
}

variable "cluster_arn" {
  description = "The ARN of the cluster on which to run your service."
}

variable "task_definition" {
  description = "The family and revision (family:revision) or full ARN of the task definition that you want to run in your service."
}


variable "desired_count" {
  description = "Number of instantiations of the specified task definition to place and keep running on your cluster."
}

variable "target_group_arn" {
  description = "The ARN of the Load Balancer target group to associate with the service."
}

variable "container_name" {
  description = "The name of the container to associate with the load balancer (as it appears in a container definition)."
}

variable "container_port" {
  description = "The port on the container to associate with the load balancer."
}
