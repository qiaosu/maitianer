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

  it "should require a timeline title" do
  	@baby.build_timeline(@attr.merge(:title => "")).should_not be_valid
  end

  it "should require a baby id" do
  	Timeline.new(@attr).should_not be_valid
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
#  url_alias   :string(255)
#  baby_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

