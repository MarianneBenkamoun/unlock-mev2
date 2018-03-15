class Service < ApplicationRecord
    belongs_to :parent, :class_name => 'Service', optional: true
    has_many :childrens, :class_name => 'Service', :foreign_key => 'parent_id'
end
