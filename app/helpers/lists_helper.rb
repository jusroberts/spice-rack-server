require 'food_display'

module ListsHelper

  def list_item_image_options list_item
    list_item_display_data = FoodDisplay.data list_item.item.name

    {
      class: "icon-#{ list_item_display_data.image }",
      style: "color: #{ list_item_display_data.color };"
    }
  end

  def list_item_in_stock_icon list_item
    icon in_stock_icon(list_item.in_stock).sub('fa-', ''), nil, data: { check: in_stock_icon(!list_item.in_stock) }
  end

  private

  def in_stock_icon in_stock
    "fa-#{ in_stock ? 'check-square-o' : 'square-o' }"
  end

end