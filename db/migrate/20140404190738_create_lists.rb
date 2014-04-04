class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.belongs_to :user

      t.timestamps
    end
  end
end
