# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# create cards: name, manufacturer, sku
Card.create(name: "Geforce GTX 760", manufacturer: "Nvidia", sku: "gfgtx760")
Card.create(name: "Geforce GTX 780", manufacturer: "Nvidia", sku: "gfgtx780")
Card.create(name: "Geforce GTX 1080", manufacturer: "Nvidia", sku: "gfgtx1080")
Card.create(name: "Geforce GTX 1080 TI", manufacturer: "Nvidia", sku: "gfgtx1080ti")
Card.create(name: "Radeon RTX 3600", manufacturer: "Radeon", sku: "rtx3600")
Card.create(name: "Geforce GTX 3080", manufacturer: "Nvidia", sku: "gfgtx3080")
Card.create(name: "Geforce GTX 1080 TI", manufacturer: "Nvidia", sku: "")

# create merchants
Merchant.create(name: "newegg", url: "newegg.com")
Merchant.create(name: "bestbuy", url: "bestbuy.com")
Merchant.create(name: "circuitcity", url: "circuitcity.com")
Merchant.create(name: "officedepot", url: "officedepot")

# add cards to merchants
Card.all.each do |card|
    inStock = rand(2) > 0 ? true : false
    
    Merchant.all.each do |merch|
        card.merchants.push(merch)

        if inStock
            r = StockRecord.where(card: card, merchant: merch)
            r.update(available: true)            
        end
        
    end
end