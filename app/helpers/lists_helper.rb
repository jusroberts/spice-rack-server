module ListsHelper

  def edit_list_item_link(list_item)
    link_to(
      list_item.in_stock ? 'I\'m Out!' : 'I\'ve Restocked!',
      edit_list_item_path(list_item.id, in_stock: !list_item.in_stock),
      class: 'columns'
    )
  end

end
