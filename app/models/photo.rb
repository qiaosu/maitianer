# coding: utf-8  
class Photo < ActiveRecord::Base
  
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
  
  attr_accessible :title, :description, :record_date, :image, :privacy_strategy, :status
  belongs_to :baby
  
  mount_uploader :image, ImageUploader
  
  validates :image, :presence => true
  validates :baby_id, :presence => true
  
  default_scope :order => 'created_at DESC'
  scope :published,  where(:status => 2)
end
# == Schema Information
#
# Table name: photos
#
#  id               :integer         not null, primary key
#  title            :string(255)
#  image            :string(255)
#  description      :string(255)
#  record_date      :date
#  privacy_strategy :integer
#  status           :integer
#  baby_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#

