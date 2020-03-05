variable "access_key" {}  # No default, should be available as BASH TF_VAR_ 
variable "secret_key" {}  # or passed in via CLI
variable "region" {
  default = "us-west-1"
}
