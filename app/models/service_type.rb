class ServiceType < ActiveRecord::Base
  has_many :contract_services
end
