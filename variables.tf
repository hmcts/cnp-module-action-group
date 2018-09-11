variable "location" {
  description = "The azure data center location"
}
variable "env" {
  description = "The application insights environment"
}
variable "resourcegroup_name" {
  description = "The name of the azure resource group"
}
variable "action_group_name" {
  description = "The name to give to the new action group"
}
variable "short_name" {
  description = "A short (12-character maximum) human-readable name for the action group"
}
variable "email_receivers" {
  type = "list"
  description = "The name of the only email recipient for this group"
  default = []
}
