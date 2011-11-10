require 'spec_helper'

describe Milestone do
  before(:each) do
    @user = Factory(:user)
    @baby = Factory(:baby, :user => @user)
    
    @attr = {
      :milestone_content => "Milestone content"
    }
  end
  
  it "should create a new instance given valid attributes" do
    @baby.milestones.create!(@attr)
  end
  
  describe "baby associations" do
    before(:each) do
      @milestone = Factory(:milestone, :baby => @baby)
    end
    
    it "should have a baby attribute" do
      @milestone.should respond_to(:baby)
    end
    
    it "should have the right association baby" do
      @milestone.baby_id == @baby.id
      @milestone.baby == @baby
    end
  end
  
  describe "validations" do
    it "should require a nonblack milestone content" do
      @baby.milestones.build(@attr.merge(:milestone_content => "")).should_not be_valid
    end
    
    it "should reject long milestone content" do
      @baby.milestones.build(@attr.merge(:milestone_content => "a" * 201)).should_not be_valid
    end
    
    it "should require a baby id" do
      Milestone.new(@attr).should_not be_valid
    end
  end
end
# == Schema Information
#
# Table name: milestones
#
#  id                :integer         not null, primary key
#  milestone_content :text
#  baby_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#

