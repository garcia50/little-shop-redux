require 'csv'
require './app/models/merchant'
require './app/models/category'
require './app/models/item'

class Seed
  OPTIONS = {headers: true, header_converters: :symbol}
  images = ["https://s3.amazonaws.com/backpackersverse/wp-content/uploads/2016/07/20101209/Doll-Enjoys-Burning-Her-Victims-Alive.jpg",
            "http://buzzvital.com/wp-content/uploads/-000//1/desktop-1429122811.jpg",
            "https://s3.amazonaws.com/backpackersverse/wp-content/uploads/2016/07/20100018/Ventriloquist-Doll-Speaks-In-Demonic-Tongues.jpg",
            "https://i.ebayimg.com/thumbs/images/g/vTAAAOSwsZJaZOzh/s-l225.jpg",
            "https://s-media-cache-ak0.pinimg.com/236x/a2/c1/c1/a2c1c1fd816c761a07dfe1c9e1c78e4c--creepy-dolls-siamese.jpg"
            ]
  count = 0

  CSV.foreach("./db/csv/merchants.csv", OPTIONS) do |row|
    Merchant.create!(row.to_hash)
  end

  CSV.foreach("./db/csv/items.csv", OPTIONS) do |row|
    count += 1
    Item.create!( title:       row[:name],
                  description: row[:description],
                  unit_price:  row[:unit_price],
                  image:       images[count % images.length],
                  merchant_id: row[:merchant_id]
                )
  end

  CSV.foreach("./db/csv/category.csv", OPTIONS) do |row|
    Category.create!(row.to_hash)
  end

  items = Item.all

  items.each do |item|
    if item.price > 500
      # item [category_1]
    elsif item.price < 500 && item.price > 100
      # item [category_2]
    else
      #item [category_3]
    end
    
end
