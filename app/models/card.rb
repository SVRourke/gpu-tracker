class Card < ApplicationRecord
    has_many :stockrecords
    has_many :merchants, through: :stockrecords
end
