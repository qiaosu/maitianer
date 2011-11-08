require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = I18n.t("maitianer")
  end

  describe "GET 'home'" do
    describe "when not signed in" do
      
      it "should redirect to login" do
        get 'home'
        response.should redirect_to(new_user_session_path)
      end
      
    end
    
    describe "when first signed in" do
      
      before(:each) do
        @user = Factory.create(:user)
        sign_in @user
      end
      
      it "should redirect to create baby" do
        get 'home'
        response.should redirect_to(new_baby_path)
      end

    end
    
    describe "when signed in and baby created" do
      
      before(:each) do
        @user = Factory.create(:user)
        @baby = Factory.create(:baby, :user => @user)
        sign_in @user
      end
      
      it "should be success" do
        get 'home'
        response.should be_success
      end
      
      it "should have the right title" do
        get 'home'
        response.should have_selector("title", :content => I18n.t("pages.home") + " | #{@base_title}")
      end
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
