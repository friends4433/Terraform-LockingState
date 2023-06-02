resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.vpc_name}"
    environment = "${var.environment}"
    depends_on = "aws_s3_bucket.s3_logs" 
  }
  
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.IGW_name}"
  }
}

resource "aws_flow_log" "vpc_flow_log" {
  log_destination      = "${aws_s3_bucket.S3_logs.arn}"
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = "${aws_vpc.default.id}"
  
  tags = {
    Name = "VPC-FLowLogs_S3"
  }
     
}


