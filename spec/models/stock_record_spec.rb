require 'rails_helper'

RSpec.describe StockRecord, type: :model do
  before(:each) do
    @card = Card.create(name: "GeForce GTX 760", manufacturer: "Nvidia", sku: "023942834a23480")
    @merchant = Merchant.create(name: "newegg", url: "https://www.newegg.com")
    @card.merchants.push(@merchant)
  end

  describe "Availablilty" do
    it "is false by default" do
      # byebug
      expect(@card.stock_records.first().available).to be false      
    end
  end

  describe "is invalid without a" do
    it "merchant" do
      sr = StockRecord.create(card: @card)
      expect(sr.valid?).to be false
    end
    
    it "card" do
      sr = StockRecord.create(merchant: @merchant)
      expect(sr.valid?).to be false
    end

  end
end
