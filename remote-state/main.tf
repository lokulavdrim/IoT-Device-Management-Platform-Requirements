resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-iot-management-platform"

  tags = {
    Name = "terraform-state-iot-management-platform"
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "TerraformLocks"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
