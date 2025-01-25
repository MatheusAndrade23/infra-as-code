module "s3" {
  source         = "./modules/s3"
  s3_bucket_name = "my-bucket"
  s3_tags = {
    Iac = true
  }
}

module "cloudfront" {
  source          = "./modules/cloudfront"
  origin_id       = module.s3.bucket_id
  domain_name     = module.s3.bucket_domain_name
  cdn_price_class = "PriceClass_200"
  cdn_tags = {
    Iac = true
  }
  depends_on      = [module.s3]
}

resource "aws_s3_bucket_website_configuration" "bucket" {
  bucket = aws_s3_bucket.bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
  
  depends_on = [aws_s3_bucket.bucket]
}