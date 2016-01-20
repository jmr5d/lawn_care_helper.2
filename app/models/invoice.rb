class Invoice < ActiveRecord::Base
  belongs_to :contract
  has_many :payments
end
