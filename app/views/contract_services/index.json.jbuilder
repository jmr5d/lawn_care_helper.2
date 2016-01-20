json.array!(@contract_services) do |contract_service|
  json.extract! contract_service, :id, :contract_id, :service_type_id
  json.url contract_service_url(contract_service, format: :json)
end
