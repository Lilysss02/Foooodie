class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.date :used_at
      t.string :shop_name
      t.string :shop_address
      t.string :url
      t.references :price, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end
