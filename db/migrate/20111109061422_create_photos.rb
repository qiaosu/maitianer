class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image
      t.string :description
      t.date :record_date
      t.integer :privacy_strategy
      t.integer :status
      t.references :baby

      t.timestamps
    end
    add_index :photos, :baby_id
  end
end
