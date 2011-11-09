CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = "cosmo2097"
  config.upyun_password = 'zhangchao'
  config.upyun_bucket = "maitianer"
  config.upyun_bucket_domain = "maitianer.b0.upaiyun.com"
end