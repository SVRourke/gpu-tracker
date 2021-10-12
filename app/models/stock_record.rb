class StockRecord < ApplicationRecord
    belongs_to :card
    belongs_to :merchant
end

# TODO: ADD LISTING URL column to model