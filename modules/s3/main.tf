resource "aws_s3_bucket" "s3_section" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "s3-bucket-acl-section" {
  bucket = aws_s3_bucket.s3_section.id
  acl    = "private"
}

resource "aws_s3_bucket_object" "function-zip-object" {
  bucket = aws_s3_bucket.s3_section.id
  key    = "function.zip"
  source = "${path.module}/function.zip"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("${path.module}/function.zip")
}