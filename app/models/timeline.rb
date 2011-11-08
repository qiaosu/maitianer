class Timeline < ActiveRecord::Base
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

