resource "aws_s3_bucket" "park-tf-state" {
  bucket = "tfstate.park.com"

  tags = {
    Environment = "park"
    Terraform   = "true"
  }
}

resource "aws_s3_bucket_acl" "park-tf-state_bucket_acl" {
  bucket = aws_s3_bucket.park-tf-state.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "park-tf-state_bucket_public" {
  bucket = aws_s3_bucket.park-tf-state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
