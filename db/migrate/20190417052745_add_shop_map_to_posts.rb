class AddShopMapToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :shop_map, :string
  end
end
