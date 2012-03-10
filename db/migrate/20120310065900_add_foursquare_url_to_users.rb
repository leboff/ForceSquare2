class AddFoursquareUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :foursquare_url, :string

  end
end
