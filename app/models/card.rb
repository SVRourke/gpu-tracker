class Card < ApplicationRecord
    has_many :stock_records
    has_many :merchants, through: :stock_records

    def inStockMerchants
        records = self.stock_records.where(available: true)
        merchants = records.map do |record|
            record.merchant
        end
        return merchants
    end
end
