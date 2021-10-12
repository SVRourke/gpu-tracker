class Manufacturer < ApplicationRecord
    has_many :stockrecords
    has_many :cards, through: :stockrecords
end
