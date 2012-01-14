class SyncRecord < ActiveRecord::Base
  belongs_to :user
end
# == Schema Information
#
# Table name: sync_records
#
#  id          :integer         not null, primary key
#  started_at  :datetime
#  finished_at :datetime
#  user_id     :integer
#  user_agent  :string(255)
#

