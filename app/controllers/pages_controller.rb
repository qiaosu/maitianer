class PagesController < ApplicationController
  
  def home
    @title = t("pages.home")
    flash.keep
    if user_signed_in?
      redirect_to baby_path(current_user.babies.first)
    else
      redirect_to new_user_session_path
    end
  end

  def about
  	@title = t("pages.about")
  end

  def contact
  	@title = t("pages.contact")
  end

  def service
  	@title = t("pages.service")
  end

  def privacy
  	@title = t("pages.privacy")
  end

end
