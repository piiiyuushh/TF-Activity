resource "aws_iam_user" "developer" {
  name          = var.developer_user_name
  path          = var.developer_user_path
  force_destroy = var.force_destroy_user
}

resource "aws_iam_user_policy" "dev_policy" {
  name   = var.developer_policy_name
  user   = aws_iam_user.developer.name
  policy = var.developer_policy_json
}

resource "aws_iam_access_key" "dev_key" {
  user    = aws_iam_user.developer.name
  pgp_key = var.pgp_key
}
