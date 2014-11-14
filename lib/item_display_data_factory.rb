ItemDisplayData = Struct.new :icon, :color

class ItemDisplayDataFactory
  attr_reader :item_name

  def initialize query
    @item_name = query.singularize
  end

  def data
    ItemDisplayData.new icon, color
  end

  private

  def item_display_data
    @item_display_data ||= YAML.load(File.open "#{ File.dirname(__FILE__) }/item_display_data.yaml")[item_name]
  end

  def icon
    item_display_data['icon']
  rescue
    'default'
  end

  def color
    item_display_data['color']
  rescue
    '#000000'
  end

end
