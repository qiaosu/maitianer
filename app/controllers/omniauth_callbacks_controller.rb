class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def tsina
    
    render :text => env["omniauth.auth"].to_yaml
    
  end
end