# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE DYNAMODB TABLE
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_dynamodb_table" "example" {
  name = "${var.table_name}"
  hash_key = "userId"
  range_key = "department"
  billing_mode = "PAY_PER_REQUEST"

  server_side_encryption { enabled = true }
  point_in_time_recovery { enabled = true }

  attribute { name = "userId" type = "S" }
  attribute { name = "department" type = "S" }

  ttl {
    enabled = true
    attribute_name = "expires"
  }

  tags = {
    Environment = "production"
  }
}
