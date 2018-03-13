class Course < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :photodoor, PhotoUploader
  mount_uploader :photoserrure, PhotoUploader

  has_one :locksmith, :class_name => "Profile"
  has_one :customer, :class_name => "Profile"
  belongs_to :subservice
  has_many :sites, dependent: :destroy
  accepts_nested_attributes_for :sites, reject_if: :all_blank, allow_destroy: true
  monetize :price_cents

  def compute_infos

    pickup_address = self.sites.where(type_of: "pick_up").first.address
    # directions = GoogleDirections.new(pickup_address, drop_address)
    # self.time = directions.drive_time_in_minutes
    # self.kms = directions.distance_in_miles.fdiv(1.6)
    # self.price = (40 + self.time * 0.6 + self.kms * 2)
    @service = Service.find(params[:id])

    self.price = @service.price


  end


end
