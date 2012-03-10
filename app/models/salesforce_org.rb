class SalesforceOrg < ActiveRecord::Base
  attr_encrypted :token, :key => 'fr4nkAb1gn47e'
  validates_presense_of :user_id, :token, :instance

end
