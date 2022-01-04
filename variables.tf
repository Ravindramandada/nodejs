# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------

variable "region" {
  description = "Region to be used for EC2 instance"
  type        = string
  default     = "us-east-1"
}

variable "name_prefix" {
  description = "A prefix used for naming resources."
  type        = string
  default     = "demorepoecr"
}

variable "max_images_retained" {
  description = "The max number of images to keep in the repository before expiring the oldest"
  type        = number
  default     = 100
}


variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(any)
  default     = {}
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository"
  type        = bool
  default     = true
}

variable "enable_scan_on_push" {
  description = "Enable vulnarability scanning on image push"
  type        = bool
  default     = true
}
