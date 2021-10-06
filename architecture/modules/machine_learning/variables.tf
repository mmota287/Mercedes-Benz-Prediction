
variable "region" {
  type = string
}
variable "profile" {
  type = string
}
variable "project_name" {
  type = string
}
variable "repository_url" {
  type = string
}

variable "role_sagemake_arn" {
  type = string
}
variable "instance_type" {
  type = string
  default = "ml.t2.medium"
}