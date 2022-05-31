output "s3_bucket_name" {
  value = aws_s3_bucket.s3_section.bucket
}

output "s3_uploaded_object_name" {
  value = aws_s3_bucket_object.function-zip-object.key
}

output "s3_uploaded_object_hash" {
  value = aws_s3_bucket_object.function-zip-object.etag
}