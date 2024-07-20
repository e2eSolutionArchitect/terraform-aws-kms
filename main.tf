
data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

locals {
  account_id = try(data.aws_caller_identity.current.account_id, "")
  partition  = try(data.aws_partition.current.partition, "")
}

resource "aws_kms_key" "this" {
  description             = var.kms_name
  is_enabled              = var.is_enabled
  enable_key_rotation     = var.enable_key_rotation
  deletion_window_in_days = var.deletion_window_in_days
  policy                  = data.aws_iam_policy_document.kms_policy.json
  tags = merge(
    { "resourcename" = var.kms_name }, var.tags
  )
}

resource "aws_kms_alias" "this" {
  target_key_id = aws_kms_key.this.key_id
  name          = "alias/${var.kms_alias}"
}

data "aws_iam_policy_document" "kms_policy" {
  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:${local.partition}:iam::${local.account_id}:root"]
    }
    actions   = ["kms:*", ]
    resources = ["*"]
  }
}