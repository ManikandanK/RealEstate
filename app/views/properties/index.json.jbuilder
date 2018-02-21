json.array!(@properties) do |property|
  json.extract! property, :id, :name, :address, :state, :lattidue, :property_type, :user_id, :location
  json.url property_url(property, format: :json)
end
