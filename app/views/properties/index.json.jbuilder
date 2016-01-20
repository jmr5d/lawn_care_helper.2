json.array!(@properties) do |property|
  json.extract! property, :id, :address1, :address2, :city, :state, :latitude, :longitude, :altitude, :country, :zipcode, :user_id, :size_in_acres, :length_in_feet, :width_in_feet
  json.url property_url(property, format: :json)
end
