require 'food_display'

module ListsHelper

  def list_item_image_options list_item
    list_item_display_data = FoodDisplay.data list_item.item.name

    {
      class: "icon-#{ list_item_display_data.image }",
      style: "color: #{ list_item_display_data.color };"
    }
  end

end