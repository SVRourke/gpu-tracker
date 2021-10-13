require 'rails_helper'

RSpec.describe Card, type: :model do  
  describe "Is valid" do
    it "with necessary information" do
      validCard = Card.create(name: "GeForce GTX 760", manufacturer: "Nvidia", sku: "023942834a23480")
      expect(validCard.valid?).to be true
    end
    
  end
  
  describe "Is invalid" do
    it "if it already exists" do
      validCard = Card.create(name: "GeForce GTX 760", manufacturer: "Nvidia", sku: "023942834a23480")
      duplicateCard = Card.create(name: "GeForce GTX 760", manufacturer: "Nvidia", sku: "023942834a23480")
      expect(validCard.valid?).to be true
      expect(duplicateCard.valid?).to be false
      
    end

    it "without a name" do
      invalidCard = Card.create(manufacturer: "Nvidia", sku: "09232j2038d")
      expect(invalidCard.valid?).to be false
    end
    
    it "without a manufacturer" do
      invalidCard = Card.create(name: "GeForce GTX 760", sku: "09232j2038d")
      expect(invalidCard.valid?).to be false
    end
    
    it "without a sku" do
      invalidCard = Card.create(name: "GeForce GTX 760", manufacturer: "Nvidia")
      expect(invalidCard.valid?).to be false
    end
  end

  describe "it has many" do
    it "stock_records" do
      card = Card.create(name: "GeForce GTX 760", manufacturer: "Nvidia", sku: "023942834a23480")
      merchant = Merchant.create(name: "newegg", url: "https://www.newegg.com")
      card.merchants.push(merchant)
      
      expect(card.stock_records.count).to equal 1
      expect(card.stock_records.first.merchant).to eq(merchant)
      
    end
    
    it "merchants" do
      merchant = Merchant.create(name: "newegg", url: "https://www.newegg.com")
      card = Card.create(name: "GeForce GTX 760", manufacturer: "Nvidia", sku: "023942834a23480")
      card.merchants.push(merchant)
      
      expect(card.merchants.count).to equal 1
      expect(card.merchants.first).to eq(merchant)
    end
  end

  describe "#inStockMerchants" do
    it "returns a list of merchants that have the card in stock" do
      merchant = Merchant.create(name: "newegg", url: "https://www.newegg.com")
      card = Card.create(name: "GeForce GTX 760", manufacturer: "Nvidia", sku: "023942834a23480")
      card.merchants.push(merchant)
      card.stock_records.first().update(available: true)

      expect(card.inStockMerchants().count()).to eq(1)
      expect(card.inStockMerchants().first().name).to eq("newegg")
    end
  end
end
