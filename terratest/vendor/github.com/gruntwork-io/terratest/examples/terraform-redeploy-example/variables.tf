# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------


# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "instance_name" {
  description = "The names for the ASG and other resources in this module"
  default     = "asg-alb-example"
}

variable "instance_port" {
  description = "The port each EC2 Instance should listen on for HTTP requests."
  default     = 8080
}

variable "ssh_port" {
  description = "The port each EC2 Instance should listen on for SSH requests."
  default     = 22
}

variable "instance_text" {
  description = "The text each EC2 Instance should return when it gets an HTTP request."
  default     = "Hello, World!"
}

variable "alb_port" {
  description = "The port the ALB should listen on for HTTP requests"
  default     = 80
}

variable "key_pair_name" {
  description = "The EC2 Key Pair to associate with the EC2 Instance for SSH access."
  default     = ""
}
