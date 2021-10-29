# company name
variable "company" {
  type        = string
  description = "Volvo"
  default = "Volvo"
}

# application name
variable "app_name" {
  type        = string
  description = "JavaPOC"
  default = "JavaPOC"
}

# environment
variable "Environment" {
  type        = string
  description = "This variable defines the environment to be built"
  default = "QA"
}

# azure region
variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "westeurope"
}

# azure region shortname
variable "Region" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "westeurope"
}

# owner
variable "Owner" {
  type        = string
  description = "devsecops"
  default = "devsecops"
}

# description
variable "Description" {
  type        = string
  description = "Java AppService"
  default = "Java AppService"
}



variable "AssigmentCode" {
  description = "assigment code"
  type        = string
  default     = "1015529"
}

variable "Technical_Contact"{
  description = "technical contact"
  type        = string
  default     = "beata.bartoszewska-karas@volvo.com"
}
