class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :confirmable, :lockable, :timeoutable and :omniauthable
    has_one :profile
     validates_format_of :phone_number, :with => /\A^06\d{8}$|^07\d{8}$\Z/i,:message => "Entrez votre numero au format 06XXXXXXXX", :on => :update

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

    devise :omniauthable, omniauth_providers: [:facebook]


    def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
      user.profile = Customer.new(
        first_name: auth.info.first_name,
        last_name: auth.info.last_name,
        photo: auth.info.image)
    end
  end
end
