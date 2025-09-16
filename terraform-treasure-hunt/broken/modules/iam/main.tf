resource "aws_iam_user" "developer" {
  name = "dev-user"   
  path = "/"
 force_destroy = true        
}

resource "aws_iam_user_policy" "dev_policy" {
  name = "dev-policy"
  user = aws_iam_user.developer.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect":"Allow",
    "Action":"*",
    "Resource":"*"
  }]
}
EOF
}

resource "aws_iam_access_key" "dev_key" {
  user = aws_iam_user.developer.name
  pgp_key = "none"                    

}
