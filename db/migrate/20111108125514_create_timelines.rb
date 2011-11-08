class CreateTimelines < ActiveRecord::Migration
  def self.up
    create_table :timelines do |t|
      t.string :title
      t.string :description
      t.integer :status
      t.string :alias
      t.references :baby
      t.timestamps
    end
  end

  def self.down
    drop_table :timelines
  end
end
