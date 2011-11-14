class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    if resource.babies.empty?
    	new_baby_path
    else
      baby_path resource.babies.first 
    end
  end
  
end
