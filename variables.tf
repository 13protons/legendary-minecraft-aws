variable "aws_ami_id" {
  description = "The AMI ID for the EC2 instance."
  type        = string
}

variable "aws_instance_type" {
  description = "The EC2 instance type."
  type        = string
}

variable "aws_key_pair_name" {
  description = "The EC2 key pair name."
  type        = string
}

variable "aws_security_group_name" {
  description = "The security group name."
  type        = string
}
