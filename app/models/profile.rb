class Profile < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

     validates_format_of :phone_number, :with => /\A^06\d{8}$|^07\d{8}$\Z/,:message => "Entrez votre numero au format 06XXXXXXXX", :on => :update

mount_uploader :photo, PhotoUploader
  # belongs_to :entreprise
  belongs_to :user
  has_many :courses

  has_and_belongs_to_many :maisonmeres

end
