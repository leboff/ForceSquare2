class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :foursquare_id

  def self.find_for_foursquare_oauth(access_token, signed_in_resource=nil)
    Rails.logger.info access_token.to_yaml
    id = access_token.extra.raw_info.id
    data = access_token.extra.raw_info.contact
    if user = User.where(:email => data.email).first
      user
    else # Create a user with a stub password.
      User.create!(:email => data.email, :foursquare_id => id, :password => Devise.friendly_token[0,20])
    end
  end
end
