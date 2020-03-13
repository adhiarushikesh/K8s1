# New resource for the S3 bucket our application will use.
resource "aws_s3_bucket" "example" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
  bucket = "terraform-getting-started-guide"
  acl    = "private"
}

provider "aws" {
  access_key = "AKIAJROBTPB2HWJV3ECQ"
  secret_key = "rolNaotQW1apN0o6yoYt9DQqFeOs1u+l9h/VBSDY"
  region     = "ap-southeast-1"
  depends_on = ["aws_s3_bucket.example"]
}

resource "aws_instance" "example" {
  ami           = "ami-04677bdaa3c2b6e24"
  instance_type = "t1.micro"
}


resource "aws_instance" "another" {
  ami           = "ami-04677bdaa3c2b6e24"
  instance_type = "t1.micro"
  region     = "ap-southeast-1"
}