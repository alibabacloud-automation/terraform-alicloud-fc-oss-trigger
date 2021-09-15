variable "name" {
  default = "terraform_test"
}

data "alicloud_account" "default" {}

data "alicloud_regions" "default" {
  current = true
}

resource "alicloud_fc_service" "default" {
  name            = var.name
  internet_access = false
}

resource "alicloud_oss_bucket" "default" {
  bucket = var.name
}

resource "alicloud_oss_bucket_object" "default" {
  bucket = alicloud_oss_bucket.default.id
  key    = "fc/hello.zip"
  source = "./hello.zip"
}

resource "alicloud_ram_role" "default" {
  name        = var.name
  document    = <<EOF
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
  description = "this is a test"
  force       = true
}

resource "alicloud_ram_policy" "default" {
  name        = var.name
  document    = <<EOF
    {
        "Version": "1",
        "Statement": [
        {
            "Action": [
            "fc:InvokeFunction"
            ],
        "Resource": [
            "acs:fc:*:*:services/tf_cdnEvents/functions/*",
            "acs:fc:*:*:services/tf_cdnEvents.*/functions/*"
        ],
        "Effect": "Allow"
        }
        ]
    }
    EOF
  description = "this is a test"
  force       = true
}

module "example" {
  source      = "../"
  name        = var.name
  service     = alicloud_fc_service.default.name
  bucket_name = alicloud_oss_bucket.default.bucket
  bucket_id   = alicloud_oss_bucket.default.id
  oss_key     = alicloud_oss_bucket_object.default.key
  regions     = data.alicloud_regions.default.regions.0.id
  account     = data.alicloud_account.default.id
  role_arn    = alicloud_ram_role.default.arn
  role_name   = alicloud_ram_role.default.name
  policy_name = alicloud_ram_policy.default.name
}
