class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.text :milestone_content
      t.date :record_date
      t.references :photo
      t.references :baby

      t.timestamps
    end
    add_index :milestones, :baby_id
  end
end
