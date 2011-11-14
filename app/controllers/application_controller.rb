class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    if resource.babies
      baby_path resource.babies.first 
    else
      new_baby_path
    end
  end
  
end
