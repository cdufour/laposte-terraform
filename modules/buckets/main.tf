resource "aws_s3_bucket" "intro" {
    bucket = "bucket-terraform-intro-${var.student}"
}