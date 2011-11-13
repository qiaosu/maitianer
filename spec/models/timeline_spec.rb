require 'spec_helper'

describe Timeline do
	before(:each) do
		@user = Factory.create(:user)
		@baby = Factory.create(:baby, :user => @user)
		@attr = {
			:title => "XiaoNiZi"
		}
	end

  it "should create a new instance given valid attributes" do
  	@baby.create_timeline!(@attr)
  end
  
  describe "baby associations" do
    before(:each) do
      @timeline = Factory(:timeline, :baby => @baby)
    end
    
    it "should have a baby attribute" do
      @timeline.should respond_to(:baby)
    end
    
    it "should have a right association baby" do
      @timeline.baby_id = @baby_id
      @timeline.baby = @baby
    end
  end

  describe "validations" do
    it "should require a timeline title" do
    	@baby.build_timeline(@attr.merge(:title => "")).should_not be_valid
    end

    it "should require a baby id" do
    	Timeline.new(@attr).should_not be_valid
    end
  end
  
end
# == Schema Information
#
# Table name: timelines
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :string(255)
#  status      :integer
#  baby_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

