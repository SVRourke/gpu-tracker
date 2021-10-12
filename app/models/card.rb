class Card < ApplicationRecord
    has_many :stock_records
    has_many :merchants, through: :stock_records
end
