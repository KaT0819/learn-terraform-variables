# Variable declarations
variable "aws_region" {
  description = "AWS リージョン"
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr_block" {
  description = "VPCのCIDRブロック"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_count" {
  description = "プロビジョンするインスタンス数"
  type        = number
  default     = 2
}

variable "enable_vpn_gateway" {
  description = "VPCがVPNゲートウェイで構成されているかどうか"
  type        = bool
  default     = false
}

variable "public_subnet_count" {
  description = "パブリックサブネットの数"
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "プライベートサブネットの数"
  type        = number
  default     = 2
}

variable "public_subnet_cidr_blocks" {
  description = "パブリックサブネットのCIDRブロック"
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24",
  ]
}

variable "private_subnet_cidr_blocks" {
  description = "プライベートサブネットのCIDRブロック"
  type        = list(string)
  default = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",
    "10.0.105.0/24",
    "10.0.106.0/24",
    "10.0.107.0/24",
    "10.0.108.0/24",
  ]
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    project     = "project-alpha",
    environment = "dev"
  }

  validation {
    condition = length(var.resource_tags["project"]) < 16 && length(regexall("[^a-zA-Z0-9-]", var.resource_tags["project"])) == 0
    # projectは16文字以内で、文字、数字、ハイフンのみを含める必要があります。
    error_message = "The project tag must be no more than 16 characters, and only contain letters, numbers, and hyphens."
  }
  validation {
    condition = length(var.resource_tags["environment"]) < 8 && length(regexall("[^a-zA-Z0-9-]", var.resource_tags["project"])) == 0
    # environmentは8文字以内で、文字、数字、ハイフンのみを含める必要があります。
    error_message = "The project tag must be no more than 16 characters, and only contain letters, numbers, and hyphens."
  }

}

variable "ec2_instance_type" {
  description = "AWS EC2 instance type."
  type        = string
}
