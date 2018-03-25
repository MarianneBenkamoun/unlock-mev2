class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :confirmable, :lockable, :timeoutable and :omniauthable
    has_one :profile, dependent: :destroy
    accepts_nested_attributes_for :profile, reject_if: :all_blank, allow_destroy: true

  devise :database_authenticatable,
         :recoverable, :rememberable, :registerable, :trackable, :validatable

    devise :omniauthable, omniauth_providers: [:facebook]
    before_create :initialize_profile



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



  private

  def initialize_profile
    self.build_profile(
      first_name: "marianne",
      last_name: "benkamoun",
      phone_number: "0670851005",
      profile_type: "customer",
      status: true,

    )
  end
end
