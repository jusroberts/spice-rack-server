class ListItem < ActiveRecord::Base
  validates_uniqueness_of :item_id, scope: :list_id
  belongs_to :list
  belongs_to :item
end
