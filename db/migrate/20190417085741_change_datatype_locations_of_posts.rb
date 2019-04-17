class ChangeDatatypeLocationsOfPosts < ActiveRecord::Migration[5.2]
  def change
  	change_column :posts, :latitude, :string
  	change_column :posts, :longitude, :string
  end
end
