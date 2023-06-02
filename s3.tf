resource "aws_s3_bucket" "S3_logs"{
  bucket = "gvfxbucket02"
  tags = {
    Name = "Teraform-GVFX"
  }
}
