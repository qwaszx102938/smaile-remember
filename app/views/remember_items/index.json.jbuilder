json.array!(@remember_items) do |remember_item|
  json.extract! remember_item, :id, :name, :content
  json.url remember_item_url(remember_item, format: :json)
end
