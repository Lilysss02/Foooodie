class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :price_range

      t.timestamps
    end
  end
end
