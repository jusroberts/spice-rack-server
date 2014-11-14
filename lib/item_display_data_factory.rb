ItemDisplayData = Struct.new :icon, :color

class ItemDisplayDataFactory
  attr_reader :item_name

  def initialize query
    @item_name = query.singularize
  end

  def data
    ItemDisplayData.new icon, color
  end

  class << self

    def seed_data
      YAML.load(File.open "#{ File.dirname(__FILE__) }/item_display_data.yaml").each do |name, attributes|
        item_params = { name: name }

        item = Item.where(item_params).first
        item ||= Item.new item_params

        item.icon = attributes['icon']
        item.color = attributes['color']

        item.save
      end
    end

    def list
      item_display_data_yaml.map { |key, _| key }
    end

    def item_display_data_yaml
      Rails.cache.fetch 'ItemDisplayData', expires_in: 1.minute do
        YAML.load(File.open "#{ File.dirname(__FILE__) }/item_display_data.yaml")
      end
    end

  end

  private

  def item_display_data
    @item_display_data ||= ItemDisplayDataFactory.item_display_data_yaml[item_name]
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
