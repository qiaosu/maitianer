# coding: utf-8  
class Baby < ActiveRecord::Base
  
  #sex
  SEX = [
    ["男", 1],
    ["女", 2],
    ["保密", 3]
  ]
  
	attr_accessible :name, :nick_name, :birthday, :sex, :url_alias
  belongs_to :user
  has_many :photos
  has_many :milestones
  has_one :timeline

  validates :nick_name, :presence => true
  validates :birthday, :presence => true
  validates :user_id, :presence => true
end
# == Schema Information
#
# Table name: babies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  nick_name  :string(255)
#  birthday   :date
#  sex        :integer
#  url_alias  :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

