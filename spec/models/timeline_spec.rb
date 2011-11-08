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
  	Timeline.create!(@attr)
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
#  alias       :string(255)
#  baby_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

