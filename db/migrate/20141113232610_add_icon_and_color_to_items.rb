class AddIconAndColorToItems < ActiveRecord::Migration
  def change
    add_column :items, :icon, :string
    add_column :items, :color, :string
  end
end
