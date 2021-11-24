variable "memory_size" {
  description = "The specification  of oss memory size ."
  type        = number
  default     = 512
}

variable "runtime" {
  description = "The specification  of FC function runtime ."
  type        = string
  default     = "python2.7"
}

variable "handler" {
  description = "The specification  of FC function handler ."
  type        = string
  default     = "hello.handler"
}
