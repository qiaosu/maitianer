require 'spec_helper'

describe Baby do
  before(:each) do
  	@user = Factory.create(:user)
  	@baby = Factory(:baby, :user => @user)
  	@attr = {
	  	:name => "maitianer",
	  	:nick_name => "XiaoNiZi",
	  	:birthday => Date.today - 30.days,
	  	:sex => 1
  	}
  end

  it "should create a new instance given valid attributes" do
  	@user.babies.create!(@attr)
  end

  describe "user associations" do

  	it "should have a user attribute" do
  		@baby.should respond_to(:user)
  	end

  	it "should have the right associated user" do
  		@baby.user_id.should == @user.id
  		@baby.user.should == @user
  	end
  end
  
  describe "photos associations" do
    
    it "should have a photos attribute" do
      @baby.should respond_to(:photos)
    end
  end
  
  describe "milestones associations" do
    
    it "should have a milestones attribute" do
      @baby.should respond_to(:milestones)
    end
  end

  describe "validations" do
  	it "should require a nick_name" do
	  	no_nick_name_baby = @user.babies.build(@attr.merge(:nick_name => ""))
	  	no_nick_name_baby.should_not be_valid
	  end

	  it "should require a birthday" do
	  	no_birthday_baby = @user.babies.build(@attr.merge(:birthday => nil))
	  	no_birthday_baby.should_not be_valid
	  end

	  it "should require a user id" do
	  	Baby.new(@attr).should_not be_valid
	  end
	  
  end

  
end
# == Schema Information
#
# Table name: babies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  nick_name  :string(255)
#  birthday   :date
#  sex        :integer
#  url_alias  :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

