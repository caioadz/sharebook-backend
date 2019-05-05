variable "family" {
  description = "A unique name for your task definition."
}

variable "container_name" {
  description = "The name of a container. Up to 255 letters (uppercase and lowercase), numbers, hyphens, and underscores are allowed."
}

variable "container_image" {
  description = "The image used to start your container. Up to 255 letters (uppercase and lowercase), numbers, hyphens, underscores, colons, periods, forward slashes, and number signs are allowed."
}

variable "container_cpu" {
  description = "If you specify a hard limit (memory), your container will be killed if it attempts to exceed that limit."
  default     = 0
}

variable "container_memory" {
  description = "If you specify a hard limit (memory), your container will be killed if it attempts to exceed that limit."
  default     = 0
}

variable "container_memoryReservation" {
  description = "If you specify a soft limit (memoryReservation), ECS reserves that amount of memory for your container; however, the container can request up to the hard limit (if specified) or all of the available memory on the container instance, whichever is reached first."
  default     = 0
}

variable "container_portMappings" {
  description = "Port mappings allow containers to access ports on the host container instance to send or receive traffic."
  default     = []
}

variable "container_essential" {
  description = "If the essential parameter of a container is marked as true, and that container fails or stops for any reason, all other containers that are part of the task are stopped."
  default     = true
}

variable "container_environment" {
  type        = "list"
  description = "The environment variables to pass to a container."
  default     = []
}

variable "container_mountPoints" {
  type        = "list"
  description = "The mount points for data volumes in your container."
  default     = []
}
