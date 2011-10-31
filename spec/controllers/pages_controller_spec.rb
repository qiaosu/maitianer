require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = I18n.t("maitianer")
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      get 'home'
      response.should have_selector("title", :content => I18n.t("pages.home") + " | #{@base_title}")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

    it "should have the right title" do
      get 'about'
      response.should have_selector("title", :content => I18n.t("pages.about") + " | #{@base_title}")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
      get 'contact'
      response.should have_selector("title", :content => I18n.t("pages.contact") + " | #{@base_title}")
    end
  end

  describe "GET 'service'" do
    it "should be successful" do
      get 'service'
      response.should be_success
    end

    it "should have the right title" do
      get 'service'
      response.should have_selector("title", :content => I18n.t("pages.service") + " | #{@base_title}")
    end
  end

  describe "GET 'privacy'" do
    it "should be successful" do
      get 'privacy'
      response.should be_success
    end

    it "should have the right title" do
      get 'privacy'
      response.should have_selector("title", :content => I18n.t("pages.privacy") + " | #{@base_title}")
    end
  end

end
