require 'spec_helper'

describe MilestonesController do
  render_views
  
  before(:each) do
    @user = Factory(:user)
    @baby = Factory(:baby, :user => @user)
    @timeline = Factory(:timeline, :baby => @baby)
    @milestone = Factory(:milestone, :baby => @baby)
  end
  
  describe "access control" do
    it "should deny access to 'create'" do
      post :create, :baby_id => @baby
      response.should redirect_to(new_user_session_path)
    end
    
    it "should deny access to 'update'" do
      put :update, :baby_id => @baby, :id => 1
      response.should redirect_to(new_user_session_path)
    end
    
    it "should deny access to 'destroy'" do
      delete :destroy, :baby_id => @baby, :id => 1
      response.should redirect_to(new_user_session_path)
    end
  end
  
  describe "POST 'create'" do
    before(:each) do
      sign_in @user
      @attr = Factory.attributes_for(:milestone)
    end
    
    describe "failure" do
      it "should not create a milestone" do
        lambda do
          post :create, :baby_id => @baby, :milestone => @attr.merge(:milestone_content => "")
        end.should_not change(Milestone, :count)
      end
    end
    
    describe "success" do
      it "should create a milestone" do
        lambda do
          post :create, :baby_id => @baby, :milestone => @attr
        end.should change(Milestone, :count).by(1)
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
        put :update, :baby_id => @baby, :id => @milestone
        response.should redirect_to(root_path)
      end
    end
    
    describe "for an authorized user" do
      before(:each) do
        sign_in @user
        @attr = Factory.attributes_for(:milestone, :baby => @baby)
      end
      
      it "should update the milestone" do
        new_attr = @attr.merge(:milestone_content => "New content")
        put :update, :baby_id => @baby, :id => @milestone, :milestone => new_attr
        @milestone.reload
        @milestone.milestone_content.should == new_attr[:milestone_content]
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
        delete :destroy, :baby_id => @baby, :id => @milestone
        response.should redirect_to(root_path)
      end
    end
    
    describe "for an authorized user" do
      before(:each) do
        sign_in @user
      end
      
      it "should destroy the milestone" do
        lambda do
          delete :destroy, :baby_id => @baby, :id => @milestone
        end.should change(Milestone, :count).by(-1)
      end
    end
  
  end
  

end
