class Milestone < ActiveRecord::Base
  attr_accessible :milestone_content, :record_date, :photo_id
  
  belongs_to :baby
  belongs_to :photo
  
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
#  record_date       :date
#  photo_id          :integer
#  baby_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#

