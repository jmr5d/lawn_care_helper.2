json.array!(@contracts) do |contract|
  json.extract! contract, :id, :user_id, :property_id
  json.url contract_url(contract, format: :json)
end
