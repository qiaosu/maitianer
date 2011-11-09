class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image
      t.string :description
      t.integer :privacy_strategy
      t.integer :status
      t.references :timeline

      t.timestamps
    end
    add_index :photos, :timeline_id
  end
end
