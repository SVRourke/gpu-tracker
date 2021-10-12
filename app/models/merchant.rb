class Merchant < ApplicationRecord
    has_many :stock_records
    has_many :cards, through: :stock_records
end
