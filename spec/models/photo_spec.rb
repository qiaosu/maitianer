require 'spec_helper'

describe Photo do
  before(:each) do
		@user = Factory(:user)
		@baby = Factory(:baby, :user => @user)
		@attr = {
			:title => "Baby Moment",
			:description => "Baby Moment Description",
			:image => File.open(File.join(Rails.root, 'spec', 'support', 'photos', 'demo1.jpg'))
		}
	end
	
	it "should create a new instance given valid attributes" do
  	@baby.photos.create!(@attr)
  end
	
	describe "baby associations" do
	  before(:each) do
      @photo = Factory(:photo, :baby => @baby)
    end
	  
    it "should have a baby attribute" do
      @photo.should respond_to(:baby)
    end
    
    it "should have a right association baby" do
      @photo.baby_id = @baby.id
      @photo.baby = @baby
    end
  end

  describe "validations" do
    it "should require a image" do
    	@baby.photos.build(@attr.merge(:image => nil)).should_not be_valid
    end

    it "should require a baby id" do
    	Photo.new(@attr).should_not be_valid
    end
  end
  
end
# == Schema Information
#
# Table name: photos
#
#  id               :integer         not null, primary key
#  title            :string(255)
#  image            :string(255)
#  description      :string(255)
#  privacy_strategy :integer
#  status           :integer
#  baby_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#

