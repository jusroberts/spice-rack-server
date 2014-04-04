json.array!(@items) do |item|
  json.extract! item, :id, :name, :list_id, :in_stock
  json.url item_url(item, format: :json)
end
