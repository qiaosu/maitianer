# coding: utf-8  
class Photo < ActiveRecord::Base
  attr_accessible :title, :description, :image, :privacy_strategy, :status
  
  #status
  STATUS = [
    ["草稿", 1],
    ["已发布", 2],
    ["已删除", 9]
  ]
  
  #privacy strategy
  PRIVACY_STRATEGY = [
    ["完全公开", 1],
    ["只对好友公开", 2],
    ["不公开",5]
  ]
  
  belongs_to :timeline
  mount_uploader :image, ImageUploader
  validates :image, :presence => true
  validates :timeline_id, :presence => true
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

