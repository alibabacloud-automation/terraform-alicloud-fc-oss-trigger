#alicloud_ram_role
document = <<EOF
  {
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Effect": "Allow",
          "Principal": {
            "Service": [
              "fc.aliyuncs.com"
            ]
          }
        }
      ],
      "Version": "1"
  }
  EOF
force    = true

#alicloud_ram_policy
policy_document = <<EOF
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

#alicloud_fc_trigger
config = <<EOF
        {
		"events": [
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

#alicloud_fc_function
memory_size = 512
runtime     = "python3"
handler     = "fake"