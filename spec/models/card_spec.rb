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

  pending "has many stock records"
  pending "has many merchants"
end
