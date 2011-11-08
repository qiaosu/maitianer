class Baby < ActiveRecord::Base
  belongs_to :user

  validates :nick_name, :presence => true
  validates :birthday, :presence => true
  validates :user_id, :presence => true
end
