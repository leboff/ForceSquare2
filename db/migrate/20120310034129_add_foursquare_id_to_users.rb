class AddFoursquareIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :foursquare_id, :string

  end
end
