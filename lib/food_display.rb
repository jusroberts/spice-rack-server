class FoodDisplay
  Data = Struct.new :image, :color

  class << self

    def data food_name
      food_display_data = YAML.load(File.open "#{ File.dirname(__FILE__) }/food_display.yaml")[food_name]

      FoodDisplay::Data.new food_display_data['image'], food_display_data['color']
    rescue
      FoodDisplay::Data.new 'default', 'black'
    end

  end
end
