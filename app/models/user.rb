class User < ApplicationRecord

  has_one_attached :attachment
  # has_one_attached :profile_picture do |attachable|
  #   attachable.variant :thumb, resize_to_limit: [100, 100]
  # end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable , :confirmable,
          :omniauthable, omniauth_providers: [:google_oauth2 , :github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid:auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.full_name = auth.info.name 
  end
end
end

