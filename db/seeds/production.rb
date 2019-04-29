require "csv"

CSV.foreach('db/prices.csv') do |info|
  Price.create(:price_range => info[0])
end
