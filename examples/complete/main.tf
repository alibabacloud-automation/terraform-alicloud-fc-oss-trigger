data "alicloud_account" "default" {
}

data "alicloud_regions" "default" {
  current = true
}

resource "alicloud_fc_service" "default" {
  name = "tf-testacc-fc-service"
}

resource "alicloud_oss_bucket" "default" {
  bucket = "tf-testacc-oss-bucket"
}

resource "alicloud_oss_bucket_object" "default" {
  bucket = alicloud_oss_bucket.default.id
  key    = "fc/hello.zip"
  source = "hello.zip"
}

resource "alicloud_ram_role" "default" {
  name     = "tf-testacc-ram-role"
  document = var.document
  force    = var.force
}

resource "alicloud_ram_policy" "default" {
  policy_name     = "tf-testacc-ram-policy"
  policy_document = var.policy_document
  force           = var.force
}

module "example" {
  source = "../.."

  #alicloud_fc_function
  name        = "tf-testacc-fc-name"
  service     = alicloud_fc_service.default.name
  bucket_id   = alicloud_oss_bucket.default.id
  oss_key     = alicloud_oss_bucket_object.default.key
  memory_size = var.memory_size
  runtime     = var.runtime
  handler     = var.handler

  #alicloud_ram_role_policy_attachment
  role_name   = alicloud_ram_role.default.name
  policy_name = alicloud_ram_policy.default.name
  policy_type = "Custom"

  #alicloud_fc_trigger
  role_arn    = alicloud_ram_role.default.arn
  type        = "oss"
  regions     = data.alicloud_regions.default.regions.0.id
  account     = data.alicloud_account.default.id
  bucket_name = alicloud_oss_bucket.default.bucket
  config      = var.config

}