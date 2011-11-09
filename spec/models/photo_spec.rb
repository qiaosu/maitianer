require 'spec_helper'

describe Photo do
  before(:each) do
		@user = Factory.create(:user)
		@baby = Factory.create(:baby, :user => @user)
		@timeline = Factory.create(:timeline, :baby => @baby)
		@attr = {
			:title => "Baby Moment",
			:description => "Baby Moment Description",
			:image => File.open(File.join(Rails.root, 'spec', 'support', 'photos', 'demo1.jpg'))
		}
	end

	it "should create a new instance given valid attributes" do
  	@timeline.photos.create!(@attr)
  end

  it "should require a image" do
  	@timeline.photos.build(@attr.merge(:image => nil)).should_not be_valid
  end

  it "should require a timeline id" do
  	Photo.new(@attr).should_not be_valid
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
#  timeline_id      :integer
#  created_at       :datetime
#  updated_at       :datetime
#

