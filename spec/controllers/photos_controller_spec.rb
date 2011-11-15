require 'spec_helper'

describe PhotosController do
  render_views
  
  before(:each) do
    @user = Factory(:user)
    @baby = Factory(:baby, :user => @user)
    @photo = Factory(:photo, :baby => @baby)
  end
  
  describe "access control" do
    it "should deny access to 'create'" do
      post :create, :baby_id => @baby
      response.should redirect_to(new_user_session_path)
    end
    
    it "should deny access to 'update'" do
      put :update, :baby_id => @baby, :id => @photo
      response.should redirect_to(new_user_session_path)
    end
    
    it "should deny access to 'destroy'" do
      delete :destroy, :baby_id => @baby, :id => @photo
      response.should redirect_to(new_user_session_path)
    end
  end
  
  describe "GET 'new'" do
    before(:each) do
      sign_in @user
    end
    
    it "should be success" do
      get :new, :baby_id => @baby
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      sign_in @user
    end
    
    it "should be success" do
      get :edit, :baby_id => @baby, :id => @photo
      response.should be_success
    end
  end
  
  describe "POST 'create'" do
    before(:each) do
      sign_in @user
      @attr = Factory.attributes_for(:photo, :baby_id => @baby.id)
    end
    
    describe "failure" do
      it "should not create a photo" do
        lambda do
          post :create, :baby_id => @baby, :photo => @attr.merge(:image => nil)
        end.should_not change(Photo, :count)
      end
    end
    
    describe "success" do
      it "should create a photo" do
        lambda do
          post :create, :baby_id => @baby, :photo => @attr
        end.should_not change(Photo, :count).by(1)
      end
      
      it "should have a flash message" do
      end
    end
  end
  
  describe "PUT 'update'" do
    describe "for an unauthorized user" do
      before(:each) do
        wrong_user = Factory(:user, :email => Factory.next(:email))
        Factory(:baby, :user => wrong_user)
        sign_in wrong_user
      end
      
      it "should deny access" do
        put :update, :baby_id => @baby, :id => @photo
        response.should redirect_to(root_path)
      end
    end
    
    describe "for an authorized user" do
      before(:each) do
        sign_in @user
        @attr = Factory.attributes_for(:photo, :baby => @baby)
      end

      it "should update the photo" do
        new_attr = @attr.merge(:title => "New title")
        put :update, :baby_id => @baby, :id => @photo, :photo => new_attr
        @photo.reload
        @photo.title.should == new_attr[:title]
      end
    end
  end
  
  describe "DELETE 'destroy'" do
    describe "for an unauthorized user" do
      before(:each) do
        wrong_user = Factory(:user, :email => Factory.next(:email))
        Factory(:baby, :user => wrong_user)
        sign_in wrong_user
      end
      
      it "should deny access" do
        delete :destroy, :baby_id => @baby, :id => @photo
        response.should redirect_to(root_path)
      end
    end
    
    describe "for an authorized user" do
      before(:each) do
        sign_in @user
      end
      
      it "should destroy the milestone" do
        lambda do
          delete :destroy, :baby_id => @baby, :id => @photo
        end.should change(Photo, :count).by(-1)
      end
    end
  end

end
