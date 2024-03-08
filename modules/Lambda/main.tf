resource "aws_lambda_function" "my_lambda_function" {
  function_name = "my-lambda-function"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "index.handler" # Adjust based on your runtime and entry point
  runtime       = "python3.8"     # Specify your runtime
  filename      = "${path.module}/lambda_function.zip"

  tags = {
    Name = "ExampleLambdaFunction"
  }
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "lambda_exec_policy_attachment" {
  name       = "lambda_exec_policy_attachment"
  roles      = [aws_iam_role.lambda_exec_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
