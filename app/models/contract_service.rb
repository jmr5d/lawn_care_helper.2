class ContractService < ActiveRecord::Base
  belongs_to :contract
  belongs_to :service_type
end
