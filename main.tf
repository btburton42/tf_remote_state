provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

resource "aws_s3_bucket" "remote_state" {
  bucket = "${var.prefix}-remote-state-${var.environment}"
  acl = "authenticated-read"

  versioning {
    enabled = true
  }

  tags {
    Name = "${var.prefix}-remote-state-${var.environment}"
    Environment = "${var.environment}"
  }
}
