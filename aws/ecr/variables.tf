variable "region" {
  description = "The AWS region to create resources in."
  type        = string
}

variable "access_key" {
  description = "The AWS access key."
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "The AWS secret key."
  type        = string
  sensitive   = true
}

variable "repository_name" {
  description = "The name of the ECR repository."
  type        = string
  default     = "my-ecr-tf-repository"
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the ECR repository."
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Whether to enable image scanning on push."
  type        = bool
  default     = true
}

variable "encryption_type" {
  description = "The encryption type for the ECR repository."
  type        = string
  default     = "AES256"
}