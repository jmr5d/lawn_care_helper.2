class ServiceType < ActiveRecord::Base
  has_many :contract_services
  has_many :contracts, :through => :contract_services
end
