#alicloud_ram_role
variable "document" {
  description = "Authorization strategy of the RAM role."
  type        = string
  default     = <<EOF
    {
        "Version": "1",
        "Statement": [
            {
                "Action": "cdn:Describe*",
                "Resource": "*",
                "Effect": "Allow",
                "Principal": {
                "Service":
                    ["log.aliyuncs.com"]
                }
            }
        ]
    }
    EOF
}

variable "force" {
  description = "This parameter is used for resource destroy."
  type        = bool
  default     = false
}

#alicloud_ram_policy
variable "policy_document" {
  description = "Name of the RAM policy."
  type        = string
  default     = <<EOF
  {
    "Version": "1",
    "Statement": [
      {
        "Action": [
          "oss:ListObjects",
          "oss:GetObject"
        ],
        "Effect": "Allow",
        "Resource": [
          "acs:oss:*:*:mybucket",
          "acs:oss:*:*:mybucket/*"
        ]
      }
    ]
  }
  EOF
}

#alicloud_fc_function
variable "memory_size" {
  description = "The specification  of oss memory size ."
  type        = number
  default     = 128
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

#alicloud_fc_trigger
variable "config" {
  description = "The config of Function Compute trigger."
  type        = string
  default     = <<EOF
        {
		"events": [
		  "oss:ObjectCreated:PostObject",
          "oss:ObjectCreated:PutObject"
		],
		"filter": {
			"key": {
                "prefix": "source/",
                "suffix": ".png"
			}
		}
	}
EOF
}