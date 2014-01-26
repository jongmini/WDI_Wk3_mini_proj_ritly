class AddUserCountToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :user_count, :integer
  end
end
