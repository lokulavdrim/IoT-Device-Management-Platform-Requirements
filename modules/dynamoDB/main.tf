resource "aws_dynamodb_table" "my_dynamoDB_table" {

  name                        = var.dynamoDB-name
  billing_mode                = var.billing_mode
  table_class                 = var.table_class
  hash_key                    = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  tags = {
    Name = "DynamoDB Table"
  }

}
