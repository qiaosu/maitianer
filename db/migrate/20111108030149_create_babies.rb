class CreateBabies < ActiveRecord::Migration
  def change
    create_table :babies do |t|
      t.string :name
      t.string :nick_name
      t.date :birthday
      t.integer :sex
      t.references :user

      t.timestamps
    end
    add_index :babies, :user_id
  end
end
