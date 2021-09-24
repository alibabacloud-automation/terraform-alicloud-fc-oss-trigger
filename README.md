Terraform module which creates Function Compute OSS trigger resource on Alibaba Cloud

terraform-alicloud-fc-oss-trigger
=====================================================================

English | [简体中文](README-CN.md)

This module is used to create Function Compute OSS trigger resource under Alibaba Cloud.

These types of resources are supported:

* [alicloud_fc_trigger](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/fc_trigger)

## Usage

```hcl
module "example" {
  source      = "terraform-alicloud-modules/fsc-oss-trigger/alicloud"
  name        = "ft-fc-oss-trigger"
  policy_type = "Custom"
  runtime     = "python2.7"
  handler     = "hello.handler"
  memory_size = 512
}
```

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`. If you have not set them
  yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.56.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.56.0 |

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
