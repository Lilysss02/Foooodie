class AddReviewToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :review, :string
  end
end
