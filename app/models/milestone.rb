class Milestone < ActiveRecord::Base
  attr_accessible :milestone_content
  
  belongs_to :baby
  
  validates :milestone_content, :presence => true, :length => { :maximum => 200 }
  validates :baby_id, :presence => true
  
  default_scope :order => "created_at DESC"
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

