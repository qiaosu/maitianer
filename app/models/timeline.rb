# coding: utf-8  
class Timeline < ActiveRecord::Base
  
  #status
  STATUS = [
    ["可用", 1],
    ["不可用", 2]
  ]
  
  attr_accessible :title, :description, :alias
  belongs_to :baby

  validates :title, :presence => true
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

