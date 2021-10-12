class Card < ApplicationRecord
    has_many: StockRecords
    has_many: Merchants, through: StockRecords
end
