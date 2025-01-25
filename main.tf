module "s3" {
  source         = "./modules/s3"
  s3_bucket_name = "my-bucket"
}

module "cloudfront" {
  source = "./modules/cloudfront"
  origin_id = module.s3.bucket_id
  domain_name = module.s3.bucket_domain_name
  depends_on = [module.s3]
}