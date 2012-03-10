class AddEncryptedFieldsToSalesforceOrgs < ActiveRecord::Migration
  def change
    add_column :salesforce_orgs, :encrypted_token, :string

  end
end
