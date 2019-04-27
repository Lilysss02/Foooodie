class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :title
      t.text :body
      t.date :used_at
      t.string :shop_name
      t.string :shop_address
      t.string :url
      t.references :price, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: 0, null: false, limit: 1
      t.string :shop_map
      t.string :latitude
      t.string :longitude
      t.string :review

      t.timestamps
    end
  end
end
