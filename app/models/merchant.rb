class Merchant < ApplicationRecord
    has_many :stock_records
    has_many :cards, through: :stock_records

    def inStockCards
        records = self.stock_records.where(available: true)
        cards = records.map do |record|
            record.card
        end
        return cards
    end
end
