class Subservice < ApplicationRecord
  belongs_to :service
  belongs_to :parent, :class_name => 'Subservice'
  has_many :children, :class_name => 'Subservice', :foreign_key => 'subservice_id'
end
