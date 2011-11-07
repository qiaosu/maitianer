class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def tsina
    render :text => env["omniauth.auth"].except('extra').to_yaml
  end

  def douban
  	render :text => env["omniauth.auth"].except('extra').to_yaml
  end

  def renren
  	render :text => env["omniauth.auth"].except('extra').to_yaml
  end

  def tqq
  	render :text => env["omniauth.auth"].except('extra').to_yaml
  end

  def renren_new 
    render :text => env["omniauth.auth"].except('extra').to_yaml
  end
end