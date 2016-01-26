class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  has_many :contracts
  has_many :properties
  # validates_formatting_of :phone, using: :us_phone
  accepts_nested_attributes_for :properties, reject_if: proc {|a| a['address1'].blank? }, allow_destroy: true
  # reject_if: proc {|attribs| attribs.any.blank? }, 

  def with_properties
  	self.properties.build
  	self
  end
end