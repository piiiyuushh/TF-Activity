resource "aws_s3_bucket" "state" {
  bucket = "ot-terraform-state"
  acl    = "public-read"  
}
