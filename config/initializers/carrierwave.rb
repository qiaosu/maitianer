CarrierWave.configure do |config|
	if Rails.env.production?
	  config.storage = :upyun
	  config.upyun_username = "cosmo2097"
	  config.upyun_password = 'zhangchao'
	  config.upyun_bucket = "maitianer"
	  config.upyun_bucket_domain = "maitianer.b0.upaiyun.com"
	elsif Rails.env.development?
		config.storage = :file
	else
		config.storage = :file
	end
end