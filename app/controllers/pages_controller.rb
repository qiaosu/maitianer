class PagesController < ApplicationController
  def home
    @title = t("pages.home")
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
