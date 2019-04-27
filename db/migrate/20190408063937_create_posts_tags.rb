class CreatePostsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :posts_tags, :id => false, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :post, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
