terraform {
  backend "s3" {
    bucket         = "my-tf-state-bucket545"
    key            = "global/s3/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
