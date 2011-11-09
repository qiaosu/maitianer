class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.string :title
      t.string :description
      t.integer :status
      t.string :url_alias
      t.references :baby

      t.timestamps
    end
    add_index :timelines, :baby_id
  end
end
