class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name

      t.timestamps
    end
  	add_index :tags, :name, unique: true
  end
end
