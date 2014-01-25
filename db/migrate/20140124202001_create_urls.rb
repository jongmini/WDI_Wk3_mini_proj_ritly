class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :og_url
      t.string :new_url

      t.timestamps
    end
  end
end
