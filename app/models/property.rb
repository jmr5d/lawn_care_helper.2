class Property < ActiveRecord::Base
  belongs_to :user
  has_many :contracts
  validates_formatting_of :zipcode, using: :us_zip
  accepts_nested_attributes_for :contracts
end
