class StockRecord < ApplicationRecord
    belongs_to :card
    belongs_to :merchant
end
