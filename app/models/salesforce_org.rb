class SalesforceOrg < ActiveRecord::Base
  attr_encrypted :token, :key => 'fr4nkAb1gn47e'
  validates_presence_of :user_id, :token, :instance
  validates_uniqueness_of :username
  belongs_to :user
end
