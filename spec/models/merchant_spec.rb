  require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "it is invalid" do
    it "without a name" do
      invalid = Merchant.create(url: "www.google.com")
      expect(invalid.valid?).to be false      
    end
    
    it "without a valid url" do
      invalid = Merchant.create(url: "www.google")
      expect(invalid.valid?).to be false      
      
    end
    
    it "if it already exists (name)" do
      Merchant.create(name: "Newegg", url: "www.google.com")
      invalid = Merchant.create(name: "Newegg", url: "www.newegg.com")
      expect(invalid.valid?).to be false      
    end

    it "if it already exists (url)" do
      Merchant.create(name: "Newegg", url: "www.google.com")
      invalid = Merchant.create(name: "Amazon", url: "www.google.com")
      expect(invalid.valid?).to be false      
    end
  end

  describe "it has many" do
    it "StockRecords" do
      merchant = Merchant.create(name: "newegg", url: "https://www.newegg.com")
      card = Card.create(name: "GeForce GTX 760", manufacturer: "Nvidia", sku: "023942834a23480")
      merchant.cards.push(card)

      expect(merchant.stock_records.count).to equal 1
      expect(merchant.stock_records.first.card).to eq(card)
    end
    
    it "Cards" do
      merchant = Merchant.create(name: "newegg", url: "https://www.newegg.com")
      card = Card.create(name: "GeForce GTX 760", manufacturer: "Nvidia", sku: "023942834a23480")
      merchant.cards.push(card)
      
      expect(merchant.cards.count).to equal 1
      expect(merchant.cards.first).to eq(card)
    end
  end
  
  describe "#cardsInStock" do
    it "returns a list of in stock cards" do
      merchant = Merchant.create(name: "newegg", url: "https://www.newegg.com")
      card = Card.create(name: "GeForce GTX 760", manufacturer: "Nvidia", sku: "023942834a23480")
      merchant.cards.push(card)
  
      merchant.stock_records.first.update(available: true)
  
      expect(merchant.inStockCards().count()).to equal 1
      expect(merchant.inStockCards().first().name).to eq("GeForce GTX 760")
    end
  end
end
