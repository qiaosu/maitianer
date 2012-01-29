source 'http://ruby.taobao.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'therubyracer'
gem "oa-oauth", :require => "omniauth/oauth"
gem 'devise', '~> 1.4.9'
gem 'mini_magick', "~> 3.3"
gem 'carrierwave'
gem 'table_builder', '0.0.3', :git => 'git://github.com/jchunky/table_builder.git'
gem 'plupload-rails'

group :production do
  gem 'rest-client'
  gem 'carrierwave-upyun', :git => 'https://github.com/nowa/carrierwave-upyun.git', :require => 'carrierwave/upyun'
end

group :development do
  gem 'rspec-rails', '2.6.1'
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
end

group :test do
  gem 'rspec-rails', '2.6.1'
  gem 'webrat', '0.7.1'
  gem 'factory_girl_rails', '~> 1.3'
  gem 'spork', '0.9.0.rc9'
  gem 'mocha'
end


