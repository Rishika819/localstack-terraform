provider "aws" {
  access_key = "test"  
  secret_key = "test"  
  region     = "us-east-1"
  s3_use_path_style = true 

  endpoints {
    s3        = "http://localhost:4566"
    ec2       = "http://localhost:4566"
    dynamodb  = "http://localhost:4566"
    sqs       = "http://localhost:4566"
  }
 
  skip_credentials_validation = true
  skip_metadata_api_check      = true
  skip_requesting_account_id    = true
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraform-s3-bucket-12345"  
}

resource "aws_dynamodb_table" "my_table" {
  name         = "my-table"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "id"
    type = "S"
  }

  hash_key = "id"
}

resource "aws_sqs_queue" "my_queue" {
  name = "my-queue"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  
  instance_type = "t2.micro"
}

output "s3_bucket" {
  value = aws_s3_bucket.my_bucket.id
}


output "dynamodb_table" {
  value = aws_dynamodb_table.my_table.name
}

output "sqs_queue" {
  value = aws_sqs_queue.my_queue.id
}

output "ec2_instance_id" {
  value = aws_instance.my_instance.id
}