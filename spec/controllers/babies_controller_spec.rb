require 'spec_helper'

describe BabiesController do
  render_views
    
  before(:each) do
    @user = Factory.create(:user)
    @baby = Factory.create(:baby, :user => @user)
    @timeline = Factory.create(:timeline, :baby => @baby)
  end

  describe "access control" do
    it "should deny access to 'show'" do
      get 'show', :id => 1
      response.should redirect_to(new_user_session_path)
    end

    it "should deny access to 'create'" do
      post 'create'
      response.should redirect_to(new_user_session_path)
    end

    it "should deny access to 'update'" do
      put 'update', :id => 1
      response.should redirect_to(new_user_session_path) 
    end

    it "should deny access to 'destroy'" do
      delete 'destroy', :id => 1
      response.should redirect_to(new_user_session_path)
    end
  end

  describe "GET 'show'" do
    before(:each) do
      sign_in @user
    end

    it "should be success" do
      get :show, :id => @baby
      response.should be_success
    end
  end

  describe "GET 'new'" do
    before(:each) do
      sign_in @user
    end

    it "should be success" do
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      sign_in @user
    end

    it "should be success" do
      get 'edit', :id => @baby
      response.should be_success
    end
  end

  describe "POST 'create'" do
    describe "with valid params" do
      
    end

    describe "with invalid params" do
      
    end
  end

  describe "PUT 'update'" do
    describe "with valid params" do
      
    end

    describe "with invalid params" do
      
    end
  end

  describe "DELETE 'destroy'" do
  end

end
