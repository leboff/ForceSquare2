class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :foursquare_id, :foursquare_url

  has_many :salesforce_orgs

  def self.find_for_foursquare_oauth(access_token, signed_in_resource=nil)
    raw = access_token.extra.raw_info
    id = raw.id
    data = raw.contact
    url = raw.canonicalUrl
    if user = User.where(:email => data.email).first
      user
    else # Create a user with a stub password.
      User.create!(:email => data.email, :foursquare_id => id, :foursquare_url => url , :password => Devise.friendly_token[0,20])
    end
  end
end
