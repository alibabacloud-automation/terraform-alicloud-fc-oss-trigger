resource "alicloud_fc_function" "default" {
  name        = var.name
  service     = var.service
  oss_bucket  = var.bucket_id
  oss_key     = var.oss_key
  memory_size = var.memory_size
  runtime     = var.runtime
  handler     = var.handler
}

resource "alicloud_ram_role_policy_attachment" "default" {
  role_name   = var.role_name
  policy_name = var.policy_name
  policy_type = var.policy_type
}

resource "alicloud_fc_trigger" "default" {
  name       = var.name
  service    = var.service
  function   = alicloud_fc_function.default.name
  role       = var.role_arn
  source_arn = "acs:${var.type}:${var.regions}:${var.account}:${var.bucket_name}"
  type       = var.type
  config     = var.config
  depends_on = ["alicloud_ram_role_policy_attachment.default"]
}