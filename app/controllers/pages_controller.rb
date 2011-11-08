class PagesController < ApplicationController
  before_filter :authenticate_user!, :only => :home
  
  def home
    @title = t("pages.home")
    if current_user.babies.empty?
      redirect_to new_baby_path
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
