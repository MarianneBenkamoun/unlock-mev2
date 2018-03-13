class Subservice < ApplicationRecord
  belongs_to :service
  belongs_to :subservice
  has_many :subservices

end
