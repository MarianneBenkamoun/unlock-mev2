class Service < ApplicationRecord
    validates :name, presence: true
  has_many :subservices


end
