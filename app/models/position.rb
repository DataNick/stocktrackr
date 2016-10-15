class Position < ApplicationRecord
  belongs_to :portfolio
  has_many :movements
end
