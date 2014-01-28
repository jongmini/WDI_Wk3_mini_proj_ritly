class AddUserIdToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :userID, :integer
  end
end
