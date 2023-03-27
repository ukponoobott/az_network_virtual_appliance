variable "workload" {
  type = string
  description = ""
}

variable "resource_group_name" {
  
}

variable "location" {
  
}

variable "subnet_id" {
  
}

variable "enable_ip_forwarding" {
  type = bool
  default = false
}

variable "vm_size" {
  description = "(Required) The SKU which should be used for this Virtual Machine, such as Standard_F2"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "(Required) The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created."
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "(Required) The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created."
  type        = string
  default     = "123456@Abc"
}

variable "user_data" {
  
}
