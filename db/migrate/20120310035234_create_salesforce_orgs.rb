class CreateSalesforceOrg < ActiveRecord::Migration
  def change
    create_table :salesforce_orgs do |t|
      t.integer :user_id
      t.string :username
      t.string :token
      t.string :instance

      t.timestamps
    end
  end
end
