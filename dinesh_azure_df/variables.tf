#Naming (prefix)
variable "prefix" {
  type        = string
  description = "The prefix that should be used for resources"
}

#Naming (suffix)
variable "suffix" {
  type        = string
  description = "The suffix that should be for resources"
}

variable "datafactory" {
  type        = string
  description = "deploy data factory or not?"
}

variable "datafactory_git" {
  type        = string
  description = "deploy data factory (git-enabled) or not?"
}

variable "adf_ir_name" {
  type        = string
  description = "If a self-hosted Integration Runtime is required with the Azure data factory deplyment, enter the name here. If left at default, then IR will not be deployed."
  default     = ""
}

#Location
variable "az_region" {
  type        = string
  description = "The default location for resources"
}

#Tags
variable "az_tags" {
  type        = map(any)
  description = "The default tags for resources and resources groups"
}

#Azure Data Factory
variable "git_account" {
  type        = string
  description = "GitHub Account Name"
}

variable "git_branch" {
  type        = string
  description = "The Branch of the Repository to get code from"
}

variable "git_hostname" {
  type        = string
  description = "The GitHub Ent hostname or github.com if open source repo"
}

variable "git_repo" {
  type        = string
  description = "The name of the Git repo"
}

variable "git_folder" {
  type        = string
  description = "The root folder within the repo"
}

