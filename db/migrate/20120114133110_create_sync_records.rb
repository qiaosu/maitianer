class CreateSyncRecords < ActiveRecord::Migration
  def change
    create_table :sync_records do |t|
      t.timestamp :started_at
      t.timestamp :finished_at
      t.references :user
      t.string :user_agent

    end
    add_index :sync_records, :user_id
  end
end
