class AddListItemTable < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.integer :list_id
      t.integer :item_id
      t.boolean :in_stock
      t.belongs_to :list

      t.timestamps
    end

    remove_column :items, :list_id
    remove_column :items, :in_stock
    add_index :items, :name, unique: true
  end
end
