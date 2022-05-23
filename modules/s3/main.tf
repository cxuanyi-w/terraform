resource "aws_s3_bucket" "s3_section" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "s3-bucket-acl-section" {
  bucket = aws_s3_bucket.s3_section.id
  acl    = var.acl_value
}
