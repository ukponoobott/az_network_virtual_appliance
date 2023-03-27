variable "resource_group_name" {
  default = "demo-rg"
}

variable "location" {
  default = "eastus2"
}

variable "vm_size" {
  description = "(Required) The SKU which should be used for this Virtual Machine, such as Standard_F2"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "(Required) The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created."
  type        = string
}

variable "admin_password" {
  description = "(Required) The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created."
  type        = string
}

variable "subnets" {
  type = map(string)
  default = {
    "public"  = "10.0.0.0/24"
    "private" = "10.0.1.0/24"
    "dmz"     = "10.0.2.0/24"
    "bastion" = "10.0.3.0/24"
  }
}