class ChangeListsChangeNameToTitle < ActiveRecord::Migration
  def change
    remove_column :lists, :name
    add_column :lists, :title, :string
  end
end
